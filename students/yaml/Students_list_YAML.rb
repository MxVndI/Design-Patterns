require 'yaml'
require_relative "../data/DataList.rb"

class Students_list_YAML
  attr_accessor :students

  def initialize(file_path)
    @file_path = file_path
    @students = []
    load_students
  end

  def load_students()
    return unless File.exist?(@file_path)
    file_content = File.read(@file_path)
    student_data = YAML.safe_load(File.read(@file_path), permitted_classes: [Date, Symbol])
    @students = student_data.map { |data| Student.new(data) }
  end

  def save_students()
    File.open(@file_path, 'w') do |file|
      file.write(@students.map(&:to_h).to_yaml)
    end
  end

  def get_student_by_id(id)
    @students.find { |student| student.id == id }
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    start = (k - 1) * n
    students_short = @students[start, n].map { |student| StudentShort.parse_student(student) }
    data_list = DataListStudentShort.new(students_short)
    data_list
  end

  def sort_students
    @students.sort_by! { |student| "#{student.surname} #{student.name[0]}#{student.lastname[0]}" }
  end

  def add_student(student)
    new_id = (@students.map(&:id).max || 0) + 1
    student.id = new_id
    @students << student
    save_students
  end

  def update_student_by_id(id, new_student)
    index = @students.find_index { |student| student.id == id }
    return unless index

    new_student.id = id
    @students[index] = new_student
    save_students
  end

  def delete_student_by_id(id)
    @students.reject! { |student| student.id == id }
    save_students
  end

  def get_student_short_count
    @students.size
  end
end

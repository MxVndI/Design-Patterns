require 'yaml'
require_relative "student_storage_strategy.rb"

class StudentYAMLStorageStrategy < StudentStorageStrategy

  def load_students(file_path)
    return [] unless File.exist?(file_path)
    file_content = File.read(file_path)
    student_data = YAML.safe_load(file_content, permitted_classes: [Date, Symbol])
    students = []
    student_data.each do |data|
      student = Student.new(data)
      students << student unless students.any? { |s| s == student }
    end
    students
  end

  def save_students(file_path, students)
    File.open(file_path, 'w') do |file|
      file.write(students.map(&:to_h).to_yaml)
    end
  end

end

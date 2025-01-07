require_relative '../data/data_list_student_short.rb'
require_relative '../models/student_short.rb'

class StudentsListBase
    attr_reader :students
	  attr_writer :storage_strategy
  
    def initialize(storage_strategy)
      @storage_strategy = storage_strategy
    end

    def load_students(file_path)
      @students = @storage_strategy.load_students(file_path)
    end

    def save_students(file_path)
      @storage_strategy.save_students(file_path, @students)
    end
  
    def get_student_by_id(id)
      @students.find { |student| student.id == id }
    end
  
    def get_k_n_student_short_list(k, n, data_list = nil)
      start = (k - 1) * n
      students_short = @students[start, n].map { |student| StudentShort.parse_student(student) }
      data_list ||= DataListStudentShort.new(students_short)
      data_list
  end

    def sort_by_full_name!
      @students.sort_by! { |student| student.get_initials }
    end

    def add_student(student)
      if (!@students.include?(student))
        new_id = (@students.map(&:id).max || 0) + 1
        student.id = new_id
        @students << student  
    else
      raise ArgumentError, 'Этот студент уже был добавлен'
    end
  end

    def update_student_by_id(id, new_student)
      if (!@students.include?(new_student) && id != new_student.id)
        index = @students.find_index { |student| student.id == id }
        return unless index
        new_student.id = id
        @students[index] = new_student
      end
    end

    def delete_student_by_id(id)
      @students.reject! { |student| student.id == id }
    end
  
    def get_student_short_count
      @students.size
    end

end

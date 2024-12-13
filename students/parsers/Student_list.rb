class StudentsListBase
    attr_accessor :students
  
    def initialize(file_path, storage_strategy)
      @file_path = file_path
      @storage_strategy = storage_strategy
      @students = @storage_strategy.load_students(@file_path)
    end

    def load_students()
      @storage_strategy.load_students(@file_path)
    end
  
    def save_students()
      @storage_strategy.save_students(@file_path, @students)
    end
  
    def get_student_by_id(id)
      @students.find { |student| student.id == id }
    end
  
    def get_k_n_student_short_list(k, n, data_list = nil)
        start = (k - 1) * n
        students_short = self.students[start, n].map { |student| StudentShort.parse_student(student) }
        data_list ||= DataListStudentShort.new(students_short)
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

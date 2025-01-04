require 'json'
require_relative "student_storage_strategy.rb"

class StudentJSONStorageStrategy < StudentStorageStrategy

    def load_students(file_path)
      return unless File.exist?(file_path)
      file_content = File.read(file_path)
      student_data = JSON.parse(file_content, symbolize_names: true)
      students = []
      student_data.each do |data|
        student = Student.new(data)
        students << student unless students.any? { |s| s == student }
      end    
    students
    end
 
    def save_students(file_path, students)
      data = students.map(&:to_h)
      File.write(file_path, JSON.pretty_generate(data))
    end
  
end

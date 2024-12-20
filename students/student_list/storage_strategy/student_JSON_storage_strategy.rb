require 'json'
require_relative "student_storage_strategy.rb"

class StudentJSONStorageStrategy < StudentStorageStrategy
    attr_accessor :students

    def load_students(file_path)
      return unless File.exist?(@file_path)
      file_content = File.read(@file_path)
      student_data = JSON.parse(file_content, symbolize_names: true)
      @students = student_data.map { |data| Student.new(data) }
    end
  
    def save_students(file_path, students)
      File.open(@file_path, 'w') do |file|
        file.write(@students.map(&:to_h).to_json)
      end
    end
  
end

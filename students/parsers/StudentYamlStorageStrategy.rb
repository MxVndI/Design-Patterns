require 'yaml'
require_relative "../data/DataList.rb"
require_relative "StudentStorageStrategy.rb"

class Students_list_YAML < StudentStorageStrategy
  attr_accessor :students

  def load_students(file_path)
    return unless File.exist?(@file_path)
    file_content = File.read(@file_path)
    student_data = YAML.safe_load(File.read(@file_path), permitted_classes: [Date, Symbol])
    @students = student_data.map { |data| Student.new(data) }
  end

  def save_students(file_path, students)
    File.open(@file_path, 'w') do |file|
      file.write(@students.map(&:to_h).to_yaml)
    end
  end

end

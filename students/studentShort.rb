require_relative "student.rb"

class StudentShort
  attr_reader :id, :FIO, :git, :contact
  
  def initialize(student: nil, id: nil, student_info: nil)
    if student
      parseStudentInfo(student.get_info)
    elsif id && student_info
      @id = id
      parseStudentInfo(student_info)
    end
  end
  
  def parseStudentInfo(student_info)
    info = student_info.split(",")
    @FIO = info[0]
    @git = info[1]
    @contact = info[2]
  end
end

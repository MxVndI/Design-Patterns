require_relative "student.rb"

class StudentShort < StudentBase
  attr_reader :id, :fio, :git, :contact

  private_class_method :new
	
  def initialize(fio: nil, id: nil, contact: nil, git: nil)
    super(id)
    @fio = fio
    @contact = contact
    @git = git	  
  end
  
  def self.parseStudentInfo(student_info)
    info = student_info.split(",")
    fio = info[0]
    git = info[1]
    contact = info[2]
    new(fio: fio, git: git, contact: contact)
  end

  def self.parseStudent(student)
    if student.is_a?(Student)
	StudentShort.parseStudentInfo(student.get_info())
    end
  end
end

require_relative "student.rb"

class StudentShort < StudentBase
  attr_reader :id, :fio

  private_class_method :new
	
  def initialize(fio: nil, id: nil, contact: nil, git: nil)
    super(id: id, git: git)
    @fio = fio
    @contact = contact
  end
  
  def self.parse_student_info(student_info)
    info = student_info.split(",")
    id = info[0].to_i()
    fio = info[1]
    git = info[2]
    contact = info[3]
    new(id: id, fio: fio, git: git, contact: contact)
  end

  def self.parse_student(student)
    if student.is_a?(Student)
	StudentShort.parse_student_info(student.get_info())
    end
  end
end

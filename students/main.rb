require_relative "model/student.rb"
require_relative "model/studentShort.rb"

student2 = Student.new(id: 2, name: "Afd", surname: "Vdsf", lastname: "Gfd",
 phone: "89182876876", git: "fdslfdsf", telegram: "@fdsfd", mail: "test@example.com", )
#puts student2.name
#puts student2.get_initials
#puts student2.phone
#puts student2.to_s
student3 = Student.new(id: 3, name: "Hahahaha", surname: "Testim", lastname: "Bbvcbvc",
 phone: "89182876876", git: "fdslfdsf", telegram: "@ay", mail: "test@example.com", )
puts student3.name
puts student3.phone
puts student3.to_s
puts student2.to_s

studentshort1 = StudentShort.new(student: student2)
puts studentshort1.validate()
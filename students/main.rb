require_relative "student.rb"
require_relative "studentShort.rb"

student2 = Student.new(name: "Afd", surname: "Vdsf", last_name: "Gfd",
 phone: "89182876876", git: "fdslfdsf", telegram: "@fdsfd", mail: "fds@fds.cd", )
puts student2.name
puts student2.phone
puts student2.to_s
student_short1 = StudentShort.new(student: student2)
puts student_short1.FIO
student_short2 = StudentShort.new(id: 1, student_info: student2.get_info)
puts student_short2.FIO
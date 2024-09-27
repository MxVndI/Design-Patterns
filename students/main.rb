require_relative "student.rb"

student2 = Student.new(name: "Afd", surname: "Vdsf", last_name: "Gfd",
 phone: "89182876876", git: "fdslfdsf", telegram: "@fdsfd", mail: "fds@fds.cd", ) #тут ошибка из-за номера телефона :0
puts student2.name
puts student2.phone
puts student2.to_s
student2.set_contacts(git: "sfdf")
puts student2.to_s
puts student2.get_info
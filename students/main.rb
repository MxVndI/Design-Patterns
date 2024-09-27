require_relative "student.rb"

student1 = Student.new(name: "Человек", surname: "Человечек", last_name: "Петрович", phone: "891823443534")
puts student1.name
puts student1.phone
puts student1.to_s

student2 = Student.new(name: "Петрович", surname: "Петрович", last_name: "Петрович",
 phone: "89182876867", git: "fdslfdsf", telegram: "@fdsfd")
puts student2.name
puts student2.phone
puts student2.to_s
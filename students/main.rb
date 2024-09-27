require_relative "student.rb"

student1 = Student.new(name: "Человек", surname: "Человечек", last_name: "Петрович", phone: "89182344354")
puts student1.name
puts student1.phone
puts student1.to_s

student2 = Student.new(name: "Петрович", surname: "Петрович", last_name: "Петрович",
 phone: "891828768767", git: "fdslfdsf", telegram: "@fdsfd") #тут ошибка из-за номера телефона :0
puts student2.name
puts student2.phone
puts student2.to_s

#мысль, лучше запишу здесь чем забуду. Можно ли было сделать класс Validator и там уже проверять наши сущности
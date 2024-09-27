require_relative "student.rb"

student2 = Student.new(name: "Afd", surname: "Vdsf", last_name: "Gfd",
 phone: "89182876876", git: "fdslfdsf", telegram: "@fdsfd", mail: "fds@fds.cd", ) #тут ошибка из-за номера телефона :0
puts student2.name
puts student2.phone
puts student2.to_s

#мысль, лучше запишу здесь чем забуду. Можно ли было сделать класс Validator и там уже проверять наши сущности
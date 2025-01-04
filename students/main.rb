require_relative "models/student.rb"
require_relative "models/student_short.rb" 
require_relative "models/student_binary_tree.rb"
require_relative "models/student_base.rb" 
require_relative 'data/data_list.rb'
require_relative 'data/data_list_student_short.rb'
require_relative 'data/data_table.rb'
require_relative 'db/DB_connection.rb'
require_relative 'student_list/student_list.rb'
require_relative 'student_list/student_list_DB.rb'
require_relative 'student_list/storage_strategy/student_JSON_storage_strategy.rb'
require_relative 'student_list/storage_strategy/student_YAML_storage_strategy.rb'
require 'pg'

#p "Попробуем просто добавить студентов"
#student1 = Student.new(id: 2, name: "Afd", surname: "Vdsf", lastname: "Gfd",
# phone: "89182876876", git: "fdslfdsf", telegram: "@fdsfd", mail: "test@example.com", )
#student2 = Student.new(id: 3, name: "Hahahaha", surname: "Testim", lastname: "Bbvcbvc",
 #phone: "89182876876", git: "fdslfdsf", telegram: "@ay", mail: "tes2@example.com", )
#puts student2.name
#puts student2.phone


#puts "РАБОТА С ДЕРЕВОМ"

#student1 = Student.new(id: 1, name: 'John', surname: 'Doe', lastname: 'Smith', birth_date: '1990-01-15', phone: '89182876876', git: 'johnsmith123', telegram: '@johnsmith', mail: 'john.smith@example.com')
#student2 = Student.new(id: 2, name: 'Jane', surname: 'Doe', lastname: 'Johnson', birth_date: '1985-06-22', phone: '89182876876', git: 'janedoe1985', telegram: '@janedoe85', mail: 'jane.johnson@example.com')
#student3 = Student.new(id: 3, name: 'Bob', surname: 'Brown', lastname: 'Wilson', birth_date: '1992-03-12', phone: '89182876876', git: 'bobwilson92', telegram: '@bobwilson92', mail: 'bob.wilson@example.com')
#student4 = Student.new(id: 4, name: 'Alice', surname: 'Johnson', lastname: 'Brown', birth_date: '1988-09-01', phone: '89182876876', git: 'alicebrown88', telegram: '@alicebrown88', mail: 'alice.brown@example.com')
#student5 = Student.new(id: 5, name: 'Charlie', surname: 'Smith', lastname: 'Johnson', birth_date: '1995-07-25', phone: '89182876876', git: 'charliejohnson95', telegram: '@charliejohnson95', mail: 'charlie.johnson@example.com')


#tree = StudentBinaryTree.new
#tree.add(student1)
#tree.add(student2)
#tree.add(student3)
#tree.add(student4)
#tree.add(student5)

#tree.each { |student| puts student }


student1 = Student.new(name: 'Vovchick', surname: 'Taran', lastname:'Yayoy', birth_date: '2004-12-04', git: 'Ffdgf', mail: 'kingknifeYT@yandex.ru', id: 1)
student2 = Student.new(name: 'Naaashih', surname: 'Vaaaa', lastname: 'Zaaaa', git: 'test2', id: 2)
student3 = Student.new(name: 'Meow', surname: 'Kvadro', lastname: 'Kopter', git: 'Fds', mail: 'nema@gmal.com', id: 3)

st1 = StudentShort.parse_student(student1)
st2 = StudentShort.parse_student(student2)
st3 = StudentShort.parse_student(student3)

students = [st1, st2, st3]

data_list = DataListStudentShort.new(students)

puts "Имена атрибутов: #{data_list.get_names}" 

puts "Вся таблица"
data_table = data_list.get_table
puts data_table.to_s
puts
puts data_table.column_count
puts
puts data_table.row_count

puts "Информация по каждому студенту отдельно"
for i in (0..data_table.row_count-1)
	for j in (0..data_table.column_count-1)
		puts (data_table.get_element_at(i, j))
	end
end

puts "контакт первого = " + st1.contact

data_list.select(0)
data_list.select(2)

puts "Выделенные ID: #{data_list.get_selected}" 

#sql_file = 'C:/Users/Vova/Desktop/Design-Patterns/students/db/insert_student.sql'
#sql = File.read(sql_file)

#begin
 # db_connection = DatabaseConnection.instance
  #db_connection.exec(sql)
  #puts "SQL скрипт выполнен успешно."
#rescue PG::Error => e
 # puts "Ошибка при выполнении SQL скрипта: #{e.message}"#end

storage_strategy = StudentYAMLStorageStrategy.new
student_list = StudentsListBase.new(storage_strategy)
puts "Считываение с YAML"
puts student_list.load_students("C:/Users/LesunVo/Desktop/Design-Patterns/students/student_list/storage_strategy/students.yaml")
puts "Выведем по id"
puts student_list.get_student_by_id(1)

student4 = Student.new(name: 'Vovchick', surname: 'Taran', lastname:'Yayoy', birth_date: '2004-12-04', git: 'Ffdgf', mail: 'kingknifeYT@yandex.ru', id: 110)
student_list.add_student(student4)
student_list.save_students("C:/Users/LesunVo/Desktop/Design-Patterns/students/student_list/storage_strategy/students.yaml")
student_list.storage_strategy = StudentJSONStorageStrategy.new
student_list.save_students("C:/Users/LesunVo/Desktop/Design-Patterns/students/student_list/storage_strategy/students.json")

puts "Считывание с JSON"
puts student_list.load_students("C:/Users/LesunVo/Desktop/Design-Patterns/students/student_list/storage_strategy/students.json")
puts "Выведем по id"
puts student_list.get_student_by_id(1)

student_list_db = StudentsListDB.new
puts student_list_db.student_count

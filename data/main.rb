require_relative 'DataList.rb'
require_relative 'DataListStudentShort.rb'
require_relative 'DataTable.rb'
require_relative '../students/model/student.rb'
require_relative '../students/model/studentShort.rb'


student1 = Student.new(name: 'Vovchick', surname: 'Taran', lastname:'Yayoy', birth_date: '2004-12-04', git: 'Ffdgf', mail: 'kingknifeYT@yandex.ru', id: 1)
student2 = Student.new(name: 'Naaashih', surname: 'Vaaaa', lastname: 'Zaaaa', git: 'test2', id: 2)
student3 = Student.new(name: 'Meow', surname: 'Kvadro', lastname: 'Kopter', git: 'Fds', mail: 'nema@gmal.com', id: 3)

st1 = StudentShort.parse_student(student1)
st2 = StudentShort.parse_student(student2)
st3 = StudentShort.parse_student(student3)

students = [st1, st2, st3]

data_list = DataListStudentShort.new(students)

puts "Имена атрибутов: #{data_list.get_names}" # ["ФИО", "Git", "Контакт"]

data_table = data_list.get_data
puts
puts data_table.column_count
puts

for i in (0..data_table.row_count-1)
  for j in (0..data_table.column_count-1)
    puts (data_table.get_element_at(i, j))
  end
end

puts "контакт первого = " + st1.contact

data_list.select(0)
data_list.select(2)

puts "Выделенные ID: #{data_list.get_selected}" 

  
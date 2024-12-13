require_relative "../data/DataList.rb"
require_relative "../data/DataListStudentShort.rb"
require_relative "../model/StudentShort.rb"

require_relative '../model/Student.rb'
require_relative '../data/DataTable.rb'
require_relative 'Students_list_YAML.rb'


st1 = Student.new( 
  "id": 7,
  "name": "Asd",
  "surname": "Bfdg",
  "lastname": "Gre",
  "birth_date": "2003-03-03",
  "telegram": "@test3",
  "mail": "test3@gmail.com",
  "phone": nil,
  "git": "test4"
)



yaml = Students_list_YAML.new('./students.yaml')
yaml.add_student(st1)
yaml.save_students

data_list = yaml.get_k_n_student_short_list(1, 15)
data_table = data_list.get_data
for i in (0..data_table.row_count-1)
  for j in (0..data_table.column_count-1)
    print (data_table.get_element_at(i, j))
    print ("     | ")
  end
  puts
end





  
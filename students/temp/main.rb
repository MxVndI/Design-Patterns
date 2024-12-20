require_relative '../data/DataList.rb'
require_relative '../model/StudentShort.rb'
require_relative '../model/Student.rb'
require_relative '../data/DataListStudentShort.rb'
require_relative '../data/DataTable.rb'
require_relative 'Student_list_JSON.rb'


st2 = Student.new( 
  "id": 8,
  "name": "Vladimir",
  "surname": "Taran",
  "lastname": "Sergeevich",
  "birth_date": "2004-12-04",
  "telegram": "@test3",
  "email": "test3@gmail.com",
  "phone": nil,
  "git": "test3"
)


json_test = StudentsListJSON.new('./students.json')
json_test.add_student(st2)
json_test.update_student_by_id(4, st2)
json_test.sort_students
puts json_test.get_student_short_count
puts('-----------')
    
data_list = json_test.get_k_n_student_short_list(1, 5)
data_table = data_list.get_data()
for i in (1..data_table.row_count-1)
  for j in (0..data_table.column_count-1)
    print (data_table.get_element_at(i, j))
    print ("     | ")
  end
  puts
end

puts(json_test.get_student_by_id(4))

json_test.save_students()





  
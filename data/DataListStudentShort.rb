require_relative "DataList.rb"

class DataListStudentShort < DataList
    def get_names()
        ['ФИО', 'Git', 'Контакт']
    end
    
    def get_data()
        data = []
        @elements.each_with_index do |student, index|
          data << [index, student.get_initials(), student.git(), student.contact()]
        end
        DataTable.new(data)
      end
end
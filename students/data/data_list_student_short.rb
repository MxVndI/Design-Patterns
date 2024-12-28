require_relative "data_list.rb"

class DataListStudentShort < DataList
    def get_names()
        return ['№', 'ФИО', 'Git', 'Контакт']
    end
    
    def get_info()
      data=[]
      @elements.each_with_index do |student, index|
        data << [index, student.get_initials(), student.git(), student.contact()]
      end
      return data
    end
end

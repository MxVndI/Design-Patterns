require_relative "data_list.rb"

class DataListStudentShort < DataList
    def get_names()
        return ['№', 'ФИО', 'Git', 'Контакт']
    end
    
    def get_info()
      data=[]
      data << get_names()
      @elements.each_with_index do |student, index|
        data << [index+1, student.get_initials(), student.git(), student.contact()]
      end
      return data
    end
end

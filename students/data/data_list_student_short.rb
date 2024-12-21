require_relative "data_list.rb"

class DataListStudentShort < DataList
    def get_names()
        return ['№', 'ФИО', 'Git', 'Контакт']
    end
    
    def get_data()
      data=[]
      #p data
      @elements.each_with_index do |student, index|
        data << [index, student.get_initials(), student.git(), student.contact()]
      end
      #p data
      return data
    end
end
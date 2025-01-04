require_relative "data_list.rb"

class DataListStudent < DataList
    def get_names()
        return ['№', 'ФИО', 'Git', 'Telegram', 'Email', 'Phone']
    end
    
    def get_info()
      data=[]
      @elements.each_with_index do |student, index|
        data << [index, student.get_initials(), student.git(), student.telegram(), student.mail(), student.phone()]
      end
      return data
    end
end

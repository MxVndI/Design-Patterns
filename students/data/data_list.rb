require_relative 'data_table.rb'

class DataList
    def initialize(elements)
        set_elements(elements)
        @selected_ids = []
      end
    
    def select(number)
        validate_index(number)
        id = @elements[number].id 
        @selected_ids << id unless @selected_ids.include?(id)
    end
    
    def get_selected()
        return @selected_ids.dup
    end
  
    def get_names()
        raise NotImplementedError, 'Метод get_names должен быть реализован в наследниках'
    end
    
    def get_data()
	return DataTable.new(get_info())
    end

    def get_info()
        raise NotImplementedError, 'Метод get_info должен быть реализован в наследниках'
    end
	
    def get_table()
        data=[]
        data << get_names()
        data.concat(get_info())
	    return DataTable.new(data)
    end
	
    def set_elements(elements)
        unless elements.is_a?(Array)
          raise ArgumentError, 'Данные должны быть массивом'
        end
        @elements = elements.dup
    end
    
    private def validate_index(index)
        unless index.between?(0, @elements.length - 1)
          raise IndexError, 'Индекс вне диапазона'
        end
    end
    
    protected
    attr_accessor :selected
end

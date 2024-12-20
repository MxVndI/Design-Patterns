class DataTable

    def initialize(data)
        if data.is_a?(Array) && data.all? { |row| row.is_a?(Array)}
            @data = data.dup
        else
            raise ArgumentError, 'Передан не двумерный массив'
        end
    end

    def get_element_at(row, column)
        return @data[row][column].dup
    end

    def row_count()
        @data.length - 1
    end
    
    def column_count()
        @data[0].length
    end

    def to_s
        data_table_str = ""
        @data.each do |item|
          data_table_str += "#{item.to_s} \n"
        end
        return data_table_str
      end
      
end

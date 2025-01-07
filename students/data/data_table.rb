class DataTable

    def initialize(data)
        if data.is_a?(Array) && data.all? { |row| row.is_a?(Array)}
            @data = data.dup
        else
            raise ArgumentError, 'Передан не двумерный массив'
        end
    end

    def get(row, column)
        return @data[row][column].dup
    end

    def row_count()
        @data.length
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

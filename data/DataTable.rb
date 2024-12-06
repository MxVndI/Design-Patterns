class DataTable

    def initialize(data)
        if data.is_a?(Array) && data.all? { |row| row.is_a?(Array)}
            @data = data.dup
        else
            raise ArgumentError, 'Передан не двумерный массив'
        end
    end

    def get_element_at(row, column)
        return @data[row][column]
    end

    def row_count()
        @data.length
    end
    
    def column_count()
        @data[0].length
    end

end

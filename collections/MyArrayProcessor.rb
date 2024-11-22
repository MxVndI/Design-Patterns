class MyArrayProcessor
    attr_reader :array

    def initialize(array:nil)
      @array = array
    end    

    def cycle(n=nil)
        if (n.nil?)
            while true
                self.array.each {|elem| yield(elem)}
            end
        end
        if (n > 0)
            rounds = 0
            while rounds < n
                self.array.each {|elem| yield(elem)}
                rounds += 1
            end
        end
    end

    def inject(accumulator = 0)
        self.array.each do |elem|
            accumulator = yield(accumulator, elem)
        end
        return accumulator
    end

    def reject()
        result = []
        self.array.each do |elem|
            result.append(elem) unless yield(elem)
        end
        return result
    end

    def max_by(n = 1)
        return @array.max if n == 1
        result = []
        array_copy = @array.dup
        n.times do
          max_val = array_copy.max
          result << max_val unless max_val.nil?
          array_copy.delete_at(array_copy.index(max_val)) if max_val
        end
        return result
    end 
    
    def each_slice(slice_size)
        raise ArgumentError, "#{slice_size} не положительное!" if slice_size < 1  
        result = []
        i = 0
        while i < self.array.size
            slice = self.array[i, slice_size]
            result << slice.to_a
            yield slice if block_given?
            i += slice_size
        end
        return result
    end

    def sort_by
        n = @array.length
        (n - 1).times do
          (0...n - 1).each do |i|
            if yield(@array[i], @array[i + 1])
              @array[i], @array[i + 1] = @array[i + 1], @array[i]
            end
          end
        end
        @array
      end

end
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
        result
    end

end
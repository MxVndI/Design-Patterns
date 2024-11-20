class MyArrayProcessor
    def cycle(n=nil)
        if (n.nil?)
            while true
                self.array.each {|elem| yield(elem)}
            end
        elif (n > 0)
            rounds = 0
            while rounds < n
                self.array.each {|elem| yield(elem)}
                rounds += 1
            end
        end
    end
end
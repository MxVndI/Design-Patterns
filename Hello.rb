def minElementFor(array)
	min = array[0] 
	for i in 1...array.size
		if array[i] < min
			min = array[i] 
		end
	end
	return min
end

def minElementWhile(array)
	min = array[0]
	i = 1
	while i < array.size
		if array[i] < min
			min = array[i] 
		end
		i += 1
	end
	return min
end


def firstIndexPosElemFor(array)
	for i in 0...array.size
		if array[i] > 0
			return i
		end
	end
end

def firstIndexPosElemWhile(array)
	i = 0
	while i < array.size
		if (array[i] > 0)
			return i
		end
		i += 1
	end
end

puts "Введите массив:"
array=$stdin.gets.chomp.split.map {|el| el.to_i}
puts "минимальный элемент (for): #{minElementFor(array)}"
puts "минимальный элемент (while): #{minElementWhile(array)}"
puts "индекс первого положительного элемента (for): #{firstIndexPosElemFor(array)}"
puts "индекс первого положительного элемента (while): #{firstIndexPosElemWhile(array)}"
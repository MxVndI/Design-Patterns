def is_min(arr, index)
	yield (arr.min == arr.at(index))
end

def swap_min_max(arr)
	arr[arr.index(arr.min)],  arr[arr.index(arr.max)] = arr[arr.index(arr.max)], arr[arr.index(arr.min)]
	yield(arr)
end

def check_max_in_ab (array, a, b)
	arr.max >= a && arr.max < b
	yield(a, b)
end

array = gets.chomp.split.map{|el| el.to_i} 
index = gets.to_i
is_min(array , index) { |result| puts "Является ли минимумом? #{result}" }

puts array
swap_min_max(array) { |result| puts "Новый массив #{result}" }	

puts array
a = gets.to_i
b = gets.to_i
check_max_in_ab (array, a, b) { a, b puts " Максимум находися в интервале [#{a}, #{b}]" }	

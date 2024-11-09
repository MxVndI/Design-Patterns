def is_min(arr, index)
	yield (arr.min == arr.at(index))
end

def swap_min_max(arr)
	arr[arr.index(arr.min)],  arr[arr.index(arr.max)] = arr[arr.index(arr.max)], arr[arr.index(arr.min)]
	yield(arr)
end

array = gets.chomp.split.map{|el| el.to_i} 
index = gets.to_i
is_min(array , index) { |result| puts "Является ли минимумом? #{result}" }

puts array
swap_min_max(array) { |result| puts "Новый массив #{result}" }	
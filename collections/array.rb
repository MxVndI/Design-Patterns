def is_min(arr, index)
	yield (arr.min == arr.at(index))
end

def swap_min_max(arr)
	arr[arr.index(arr.min)],  arr[arr.index(arr.max)] = arr[arr.index(arr.max)], arr[arr.index(arr.min)]
	yield(arr)
end

def check_max_in_ab (arr, a, b)
	arr.max >= a && arr.max < b
	yield(a, b)
end

def avg_array_modules(arr)
	avg = arr.sum / arr.size
	yield (avg)
end

def array_more_avg_less_max(arr)
	new_array = []
	avg = arr.inject{ |sum, el| sum + el }.to_f / arr.size
	arr.each_with_index.select do |num, idx|
		if (num > avg && num < arr.max)
			new_array.append(num)
        end
    end
	yield(new_array)
end

array = gets.chomp.split.map{|el| el.to_i} 
index = gets.to_i
is_min(array , index) { |result| puts "Является ли минимумом? #{result}" }

puts array
swap_min_max(array) { |result| puts "Новый массив #{result}" }	

puts array
puts("Введите a")
a = gets.to_i
puts("Введите b")
b = gets.to_i
check_max_in_ab(array, a, b) { |result| puts "Максимум находися в интервале? #{result}" }	

puts array
avg_array_modules (array) { |avg| puts "Среднее арифметическое модулей = #{avg}" }

puts ("Исходный список = #{array}")
array_more_avg_less_max (array) { |new_array| puts "Новый список = #{new_array}" }

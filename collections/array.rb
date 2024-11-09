def is_min(arr, index)
	yield (array.min == array.at(index))
end

array = gets.chomp.split.map{|el| el.to_i} 
index = gets.to_i
is_min(array , index) { |result| puts "Является ли минимумом? #{result}" }
def count_dels number
	count_dels = 0
	number.times do |i|
		if (i != 0 && number % i == 0 && is_multiple_three?(i))
		count_dels += 1
		end
	end
	return count_dels + 1
end

def min_nechet number
	min = 9
	while number > 0 do
		if (min >= (number % 10) && is_nechet?(number % 10))
			min = number % 10
		end
		number = number / 10
	end
	return min
end

def is_multiple_three? number
	if (number % 3 != 0)
		return true
	else
		return false
	end
end

def is_nechet? number
	if number % 2 == 1
		return true
	else
		return false
	end
end

def sum_divisors number
	sum = 0
	(number+1).times do |i|
		sum_number = sum_number(number)
		mul_number = mul_number(number)
		if (i != 0 && number % i == 0 && is_vzaimo_prost?(sum_number, i) && !is_vzaimo_prost?(mul_number, i))
			sum += i
		end
	end
	return sum
end

def sum_number number
	sum = 0
	while number > 0 do
		sum += number % 10
		number = number / 10
	end
	return sum
end

def mul_number number
	multiply = 1
	while number > 0 do
		multiply *= number % 10
		number = number / 10
	end
	return multiply
end

def is_vzaimo_prost? num1, num2
	if (find_NOD(num1, num2) == 1)
		return true
	else 
		return false
	end
end

def find_NOD num1, num2
	nod = num1 >= num2 ? num1 : num2
	until (num1 % nod == 0) and (num2 % nod == 0)
		nod -= 1
	end
	return nod
end

puts "Hello World! " + ARGV[0]
puts "Введите свой любимый язык программирования"
language = $stdin.gets.chomp
if language == "ruby"
	puts "Ну и подлиза ты"
else
	case language
		when "java" then puts "ну пойдет"
		when "c++" then puts "ты маньяк что ли?"
		when "kotlin" then puts "неплохо"
		when "assembler" then puts "хахахахах"
	end
	puts "Ничего, скоро будет ruby"
end

puts "Введите команду языка Ruby"
ruby_сommand = $stdin.gets.chomp
eval(ruby_сommand)
puts "Введите команду операционной системы"
os_сommand = $stdin.gets.chomp
Kernel.`(os_сommand)

puts "Введите число"
number = $stdin.gets.chomp
divisors = count_dels(number.to_i)
puts "Количество делителей, не кратных 3: #{divisors}"
puts "Введите число"
number = $stdin.gets.chomp
min_nech = min_nechet(number.to_i)
puts "Минимальное нечетное число: #{min_nech}"
puts "Введите число"
number = $stdin.gets.chomp
sum_div = sum_divisors(number.to_i)
puts "Сумма всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа: #{sum_div}"

def min_element_for(array)
	min = array[0] 
	for i in 1...array.size
		if array[i] < min
			min = array[i] 
		end
	end
	return min
end

def min_element_while(array)
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

def first_index_pos_elem_for(array)
	for i in 0...array.size
		if array[i] > 0
			return i
		end
	end
end

def first_index_pos_elem_while(array)
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
puts "минимальный элемент (for): #{min_element_for(array)}"
puts "минимальный элемент (while): #{min_element_while(array)}"
puts "индекс первого положительного элемента (for): #{first_index_pos_elem_for(array)}"
puts "индекс первого положительного элемента (while): #{first_index_pos_elem_while(array)}"

result = 0
file = File.open(ARGV[1])
file_data = file.readlines
number = file_data[0].to_i
array = file_data[1].split.map {|el| el.to_i}
case ARGV[0]
	when 1 
		result = count_dels(number.to_i)
		puts "Количество делителей, не кратных 3: #{result}"
	when 2
		result = min_nechet(number.to_i)
		puts "Минимальное нечетное число: #{result}"
	when 3
		result = sum_divisors(number.to_i)
		puts "Сумма всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа: #{result}"
	else puts "Такого метода нет"
end
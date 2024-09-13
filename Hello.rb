def countDels number
	countDels = 0
	number.times do |i|
		if (i != 0 && number % i == 0 && isMultipleThree(i))
		countDels += 1
		end
	end
	return countDels + 1
end

def minNechet number
	min = 9
	while number > 0 do
		if (min >= (number % 10) && isNechet(number % 10))
			min = number % 10
		end
		number = number / 10
	end
	return min
end

def isMultipleThree number
	if (number % 3 != 0)
		return true
	else
		return false
	end
end

def isNechet number
	if number % 2 == 1
		return true
	else
		return false
	end
end

def sumDivisors number
	sum = 0
	(number+1).times do |i|
		sumNumber = sumNumber(number)
		mulNumber = mulNumber(number)
		if (i != 0 && number % i == 0 && isVzaimoProst(sumNumber, i) && !isVzaimoProst(mulNumber, i))
			sum += i
		end
	end
	return sum
end

def sumNumber number
	sum = 0
	while number > 0 do
		sum += number % 10
		number = number / 10
	end
	return sum
end

def mulNumber number
	multiply = 1
	while number > 0 do
		multiply *= number % 10
		number = number / 10
	end
	return multiply
end

def isVzaimoProst num1, num2
	if (findNOD(num1, num2) == 1)
		return true
	else 
		return false
	end
end

def findNOD num1, num2
	nod = num1 >= num2 ? num1 : num2
	until (num1 % nod == 0) and (num2 % nod == 0)
		nod -= 1
	end
	return nod
end


puts "Введите число"
number = $stdin.gets.chomp
divisors = countDels(number.to_i)
puts "Количество делителей, не кратных 3: #{divisors}"

puts "Введите число"
number = $stdin.gets.chomp
minNech = minNechet(number.to_i)
puts "Минимальное нечетное число: #{minNech}"

puts "Введите число"
number = $stdin.gets.chomp
sumDiv = sumDivisors(number.to_i)
puts "Сумма всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа: #{sumDiv}"
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

puts "Выберите способ ввода данных:
                    \n1. Ввести с клавиатуры
                    \n2. Прочитать из файла строку
                    \n3. Прочитать из файла списки"
input_choice = gets.chomp
case input_choice
    when "1"
        puts "Введите целые числа через пробел:"
        array = gets.chomp.split.map(&:to_i)
    when "2"
        begin
        file = File.open('C:\Users\LeSunVo\Desktop\Design-Patterns\collections\input.txt', "r")
        array = file.read.split.map(&:to_i)
        puts "Файл подключен успешно!"
        rescue Errno::ENONET => error
        puts "Обнаружена ошибка при работе с файлами: #{error}"
        exit
        ensure
        file.close if file
        end
    else
        puts "Некорректный выбор. Завершение программы."
        exit
end

puts "Выберите задачу:
        \n1. Определить, является ли элемент по индексу минимумом
        \n2. Поменять местами максимальный и минимальный элементы
        \n3. Проверить, находится ли максимум массива в интервале
        \n4. Найти среднее арифметическое модулей элементов
        \n5. Построить новый список, состоящий из элементов, больше среднего арифметического и меньше максимального"
method_choice = gets.chomp
puts
puts ("Исходный список = #{array}")
case method_choice
    when "1"
        index = gets.to_i
	is_min(array , index) { |result| puts "Является ли минимумом? #{result}" }
    when "2"
	swap_min_max(array) { |result| puts "Новый массив #{result}" }	
    when "3"
        puts("Введите a")
	a = gets.to_i
	puts("Введите b")
	b = gets.to_i
	check_max_in_ab(array, a, b) { |result| puts "Максимум находися в интервале? #{result}" }	
    when "4"
	avg_array_modules (array) { |avg| puts "Среднее арифметическое модулей = #{avg}" }
    when "5"
	array_more_avg_less_max (array) { |new_array| puts "Новый список = #{new_array}" }
    else
        puts "Некорректный выбор задачи."
    end

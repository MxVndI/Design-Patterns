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
class Student
	attr_accessor :id, :name, :surname, :last_name, :phone, :telegram, :mail, :git
	
	def initialize(name:, surname:, last_name:, phone: nil, telegram: nil, mail: nil, git: nil)
		@name = name
		@surname = surname
		@last_name = last_name
		@phone = phone
		@telegram = telegram
		@mail = mail
		@git = git
	end
	
	def to_s()
		return "Student {name: #{name}, surname: #{surname}, last_name: #{last_name}, id: #{@id}, 
		phone: #{@phone}, telegram: #{@telegram}, mail: #{@email}, git: #{@git} }\n"
	end

	
end
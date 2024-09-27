class Student
	attr_accessor :id, :name, :surname, :last_name, :phone, :telegram, :mail, :git
	
	def initialize(name:, surname:, last_name:, phone: nil, telegram: nil, mail: nil, git: nil)
		@name = name
		@surname = surname
		@last_name = last_name
		if (Student.isPhone?(phone) and phone != nil)
			@phone = phone
		else raise("Uncorrect phone number")
		end
		@telegram = telegram
		@mail = mail
		@git = git
	end
	
	def to_s()
		return "Student {name: #{name}, surname: #{surname}, last_name: #{last_name}, id: #{@id}, 
		phone: #{@phone}, telegram: #{@telegram}, mail: #{@email}, git: #{@git} }\n"
	end

	def self.isPhone?(phone)
		phone_regex = /\A\+?\d{1,2}\s?\d{10}[\s.-]?\z/
		return !!phone.match?(phone_regex)
	end

end
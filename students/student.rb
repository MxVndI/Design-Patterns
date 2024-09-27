require_relative "uservalidator.rb"

class Student
	attr_accessor :id, :name, :surname, :last_name, :phone, :telegram, :mail, :git
	
	def initialize(name:, surname:, last_name:, phone: nil, telegram: nil, mail: nil, git: nil, id: nil)
		@id = id
		if (UserValidator.is_valid_name?(name))
			@name = name
		end
		if (UserValidator.is_valid_surname?(surname))
			@surname = surname
		end
		if (UserValidator.is_valid_last_name?(last_name))
			@last_name = last_name
		end
		if (UserValidator.is_valid_phone?(phone))
			@phone = phone
		end
		if (UserValidator.is_valid_telegram?(telegram))
			@telegram = telegram
		end
		if (UserValidator.is_valid_mail?(mail))
			@mail = mail
		end
		if (UserValidator.is_valid_git?(git))
			@git = git
		end
	end
	
	def to_s()
		return "Student {name: #{name}, surname: #{surname}, last_name: #{last_name}, id: #{@id}, 
		phone: #{@phone}, telegram: #{@telegram}, mail: #{@email}, git: #{@git} }\n"
	end

end
require_relative "uservalidator.rb"
require_relative "studentBase.rb"

class Student < StudentBase
	attr_accessor :name, :surname, :lastname, :git
	attr_reader :id, :phone, :telegram, :mail 
	
	def initialize(name:, surname:, lastname:, phone: nil, telegram: nil, mail: nil, git: nil, id:)
		super(id, git: git)
		self.name = name
		self.surname = surname
		self.lastname = lastname
		set_contacts(phone: phone, telegram: telegram, mail: mail)
	end
	
	def to_s()
		return "Student {id: #{@id}, name: #{name}, surname: #{surname}, lastname: #{lastname},  
		contacts: #{get_contacts()} git: #{@git} }\n"
	end

	def set_contacts(phone: nil, telegram: nil, mail: nil)
		self.phone = phone
		self.telegram = telegram
		self.mail = mail
	end
	
	private def name=(value)
		if (UserValidator.is_valid_nameParams?(value))
			@name = value
		end
	end
	
	private def surname=(value)
		if (UserValidator.is_valid_nameParams?(value))
			@surname = value
		end
	end
	
	private def lastname=(value)
		if (UserValidator.is_valid_nameParams?(value))
			@lastname = value
		end
	end
	
	private def phone=(value)
		if (UserValidator.is_valid_phone?(value))
			@phone = value
		end
	end

	private def git=(value)
		if (UserValidator.is_valid_git?(value))
			@git = value
		end
	end
	
	private def telegram=(value)
		if (UserValidator.is_valid_telegram?(value))
			@telegram = value
		end
	end
	
	private def mail=(value)
		if (UserValidator.is_valid_mail?(value))
			@mail = value
		end
	end

	private def get_initials()
		return "#{@surname} #{@name[0]}.#{@lastname[0]}."
	end

	def get_contacts()
		contacts = [
			["телеграмм", @telegram],
			["почта", @mail],
			["телефон", @phone]
		].select { |_, value| !value.nil? && !value.empty? }
		return contacts
	end

	def get_info()
		return "#{get_initials()}, #{@git}, #{get_contacts()}"
	end
end
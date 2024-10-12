require_relative '../validator/uservalidator.rb'
require_relative "studentBase.rb"

class Student < StudentBase
	attr_accessor :name, :surname, :lastname, :git
	attr_reader :id, :phone, :telegram, :mail 
	
	def initialize(name:, surname:, lastname:, phone: nil, telegram: nil, mail: nil, git: nil, id: nil)
		super(id: id, git: git)
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
	
	def name=(value)
		validate_and_set(value, Validator.is_valid_name_params?(value)) { @name = value }
	end
	
	def surname=(value)
		validate_and_set(value, Validator.is_valid_name_params?(value)) { @surname = value }
	end
	
	def lastname=(value)
		validate_and_set(value, Validator.is_valid_name_params?(value)) { @lastname = value }
	end
	
	private def phone=(value)
		validate_and_set(value, Validator.is_valid_phone?(value)) { @phone = value }
	end
	
	private def telegram=(value)
		validate_and_set(value, Validator.is_valid_telegram?(value)) { @telegram = value }
	end
	
	private def mail=(value)
		validate_and_set(value, Validator.is_valid_mail?(value)) { @mail = value }
	end

    	private def git=(value)
		validate_and_set(value, Validator.is_valid_git?(value)) { @git = value }
        end
	
	private def get_initials()
		return "#{@surname} #{@name[0]}.#{@lastname[0]}."
	end

	def get_contacts()
		{
      telegram: @telegram,
      mail: @mail,
      phone: @phone
		}.compact
	end

	def get_info()
		return "#{get_initials()}, #{@git}, #{get_contacts()}"
	end
	
	private def validate_and_set(value, is_valid)
    		if isValid
      			yield
    		else
      			raise ArgumentError, "#{value} is invalid."
    		end
  	end

end

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
	
	private def name=(value)
		validate_and_set(value, UserValidator.method(:is_valid_nameParams?)) { @name = value }
	end
	
	private def surname=(value)
		validate_and_set(value, UserValidator.method(:is_valid_nameParams?)) { @surname = value }
	end
	
	private def lastname=(value)
		validate_and_set(value, UserValidator.method(:is_valid_nameParams?)) { @lastname = value }
	end
	
	private def phone=(value)
		validate_and_set(value, UserValidator.method(:is_valid_phone?)) { @phone = value }
	end
	
	private def telegram=(value)
		validate_and_set(value, UserValidator.method(:is_valid_telegram?)) { @telegram = value }
	end
	
	private def mail=(value)
		validate_and_set(value, UserValidator.method(:is_valid_mail?)) { @mail = value }
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
	
	def validate_and_set(value, validation_method)
    if validation_method.call(value)
      yield
    else
      raise ArgumentError, "#{value} is invalid."
    end
  end

end

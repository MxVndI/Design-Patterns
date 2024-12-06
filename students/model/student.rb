require_relative '../validator/UserValidator.rb'
require_relative "studentBase.rb"

class Student < StudentBase
	include Comparable
	
	attr_reader :name, :surname, :lastname, :phone, :telegram, :mail, :birth_date 
	
	def initialize(name:, surname:, lastname:, phone: nil, telegram: nil, mail: nil, git: nil, id: nil, birth_date: nil)
		super(id: id, git: git)
		self.name = name
		self.surname = surname
		self.lastname = lastname
		self.birth_date = birth_date if !birth_date.nil?
		set_contacts(phone: phone, telegram: telegram, mail: mail)
	end
	
	def to_s()
		return "Student {id: #{@id}, name: #{name}, surname: #{surname}, lastname: #{lastname},  
		contacts: #{get_contacts()} git: #{@git}, birh_date: #{birth_date} }\n"
	end

	def set_contacts(phone: nil, telegram: nil, mail: nil)
		self.phone = phone if !phone.nil?
		self.telegram = telegram if !telegram.nil?
		self.mail = mail if !mail.nil?
	end

	def birth_date=(value)
		validate_and_set(value, Validator.is_valid_birth_date?(value)) { @birth_date = value }
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
		puts value
		validate_and_set(value, Validator.is_valid_mail?(value)) { @mail = value }
	end

	def contact()
		if @phone
		  @phone
		elsif @telegram
		  @telegram
		elsif @mail
		  @mail
		end
	end
	  

	def <=>(student)
		self.birth_date <=> student.birth_date
	end

	def get_info()
		return "#{id}, #{get_initials()}, #{@git}, #{contact}"
	end
end

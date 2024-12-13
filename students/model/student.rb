require_relative '../validator/UserValidator.rb'
require_relative "studentBase.rb"

class Student < StudentBase
	include Comparable
	
	attr_reader :name, :surname, :lastname, :phone, :telegram, :mail, :birth_date 
	
	def initialize(params = {})
    super(id: params[:id], git: params[:git])
    
    self.name = params[:name]
    self.surname = params[:surname]
    self.lastname = params[:lastname]
    self.birth_date = params[:birth_date] if params[:birth_date]
    
    set_contacts(phone: params[:phone], telegram: params[:telegram], mail: params[:mail])
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

	def to_h() 
		{ 
    		id: self.id, 
    		name: self.name, 
    		surname: self.surname, 
    		lastname: self.lastname, 
    		birth_date: self.birth_date, 
    		telegram: self.telegram,
    		mail: self.mail, 
    		phone: self.phone, 
    		git: self.git 
    	}
	end
	
	def to_s()
		"Student {id: #{@id}, name: #{name}, surname: #{surname}, lastname: #{lastname},  
		contact: #{contact()}, git: #{@git}, birth_date: #{birth_date} }\n"
	end
end

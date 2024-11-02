require_relative '../validator/uservalidator.rb'

class StudentBase
   attr_reader :id, :git
	
   def initialize(id: nil, git: nil)
       @id = id.to_i
       self.git = git
   end

   def validate?()
	return (has_git() && has_contact()) 
    end

    def has_git?()
	return !@git.nil?    
    end

    def has_contact?()
    	return !@phone.nil? || !@telegram.nil? || !@mail.nil? || !@contact.nil?
    end
	
    def contact()
    	return @contact
    end
	
    def git=(value)
	    validate_and_set(value, Validator.is_valid_git?(value)) { @git = value }
    end
	
    protected def validate_and_set(value, is_valid)
    		if isValid
      			yield
    		else
      			raise ArgumentError, "#{value} is invalid."
    		end
    end

    def get_initials()
		return "#{@surname} #{@name[0]}.#{@lastname[0]}."
    end
  
end

require_relative '../validator/uservalidator.rb'

class StudentBase
   def initialize(id: nil, git: nil)
       self.id = id.to_i
       self.git = git
   end

   def validate()
	if (has_git() and has_contact()) 
		return true
	else 
		return false
	end
    end

    def has_git()
	return !@git.nil?    
    end

    def has_contact()
    	return !@phone.nil? or !@telegram.nil? !@mail.nil? or !@contact.nil?
    end
	
    def git=(value)
	if (UserValidator.is_valid_git?(value))
		@git = value
	end
     end
end

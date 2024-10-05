require_relative '../validator/uservalidator.rb'

class StudentBase
   def initialize(id, git: nil)
       @id = id.to_i
       @git = git
   end

   def validate()
	if (has_git() and (@phone != nil or @telegram != nil or @mail != nil or @contact != nil)) 
		return true
	else 
		return false
	end
    end

    def has_git()
	return @git != nil    
    end
	
    def git=(value)
	if (UserValidator.is_valid_git?(value))
		@git = value
	end
     end
end

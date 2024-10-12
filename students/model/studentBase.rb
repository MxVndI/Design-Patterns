require_relative '../validator/uservalidator.rb'

class StudentBase
   def initialize(id: nil, git: nil)
       @id = id.to_i
       self.git = git
   end

   def validate()
	return (has_git() && has_contact()) 
    end

    def has_git()
	return !@git.nil?    
    end

    def has_contact()
    	return !@phone.nil? || !@telegram.nil? || !@mail.nil? || !@contact.nil?
    end
	
end

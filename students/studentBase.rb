class StudentBase

	def initialize(id, git: nil)
		@id = id
		@git = git
  end

	def validate()
		if (@git != nil and (@phone != nil or @telegram != nil or @mail != nil or @contact != nil)) 
			return true
		else return false
		end
	end
	
end
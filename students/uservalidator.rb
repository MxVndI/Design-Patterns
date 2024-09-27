class UserValidator
  FULLNAME_REGEX = /\A[A-Z]{1}[A-Za-z\s'-]{2,}\z/
  GITHUB_USERNAME_REGEX = /\A[a-zA-Z0-9_-]{1,}\z/
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  TELEGRAM_USERNAME_REGEX = /\A@?[a-zA-Z0-9_]{1,}\z/
  PHONE_REGEX = /\A\+?\d{1,2}\s?\d{10}[\s.-]?\z/

  def self.is_valid_name?(name)
    return !!name.match?(FULLNAME_REGEX)
  end
  
  def self.is_valid_surname?(surname)
    return !!surname.match?(FULLNAME_REGEX)
  end
  
  def self.is_valid_last_name?(last_name)
    return !!last_name.match?(FULLNAME_REGEX)
  end

  def self.is_valid_git?(git)
    return !!git.match?(GITHUB_USERNAME_REGEX)
  end

  def self.is_valid_mail?(email)
    return !!email.match?(EMAIL_REGEX)
  end

  def self.is_valid_telegram?(telegram)
    return !!telegram.match?(TELEGRAM_USERNAME_REGEX)
  end
	
  def self.is_valid_phone?(phone)
	 return !!phone.match?(PHONE_REGEX)
  end
	
end
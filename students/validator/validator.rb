module UserValidator
  FULLNAME_REGEX = /\A[A-Z]{1}[A-Za-z\s'-]{2,}\z/
  GITHUB_USERNAME_REGEX = /\A[a-zA-Z0-9_-]{1,}\z/
  EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/
  TELEGRAM_USERNAME_REGEX = /\A@?[a-zA-Z0-9_]{1,}\z/
  PHONE_REGEX = /\A\+?\d{1,2}\s?\d{10}[\s.-]?\z/

  def self.is_valid_nameParams?(value)
    return !!value.match?(FULLNAME_REGEX) && value != nil
  end

  def self.is_valid_git?(git)
    return !!git.match?(GITHUB_USERNAME_REGEX) && git != nil
  end

  def self.is_valid_mail?(email)
    return !!email.match?(EMAIL_REGEX) && email != nil
  end

  def self.is_valid_telegram?(telegram)
    return !!telegram.match?(TELEGRAM_USERNAME_REGEX) && telegram != nil
  end
	
  def self.is_valid_phone?(phone)
	 return !!phone.match?(PHONE_REGEX) && phone != nil
  end
	
end

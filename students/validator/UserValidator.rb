require 'date'

class Validator
  FULLNAME_REGEX = /\A[A-Z]{1}[A-Za-z\s'-]{2,}\z/
  GITHUB_USERNAME_REGEX = /\A[A-Za-z0-9\s'-]{2,}\z/
  MAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/
  TELEGRAM_USERNAME_REGEX = /\A@?[a-zA-Z0-9_]{1,}\z/
  PHONE_REGEX = /\A\+?\d{1,2}\s?\d{10}[\s.-]?\z/

  def self.is_valid_name_params?(value)
    return !!value.match?(FULLNAME_REGEX) && value != nil
  end

  def self.is_valid_git?(git)
    return !!git.match?(GITHUB_USERNAME_REGEX) && git != nil
  end

  def self.is_valid_mail?(mail)
    return !!mail.match?(MAIL_REGEX) && mail != nil
  end

  def self.is_valid_telegram?(telegram)
    return !!telegram.match?(TELEGRAM_USERNAME_REGEX) && telegram != nil
  end
	
  def self.is_valid_phone?(phone)
	 return phone != nil && !!phone.match?(PHONE_REGEX)
  end
	
  def self.is_valid_birth_date?(date)
    return date = Date.parse(date) && date != nil
  end

end

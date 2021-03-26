class User < ApplicationRecord
  attr_accessor :password

  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,}) # At least 8 characters long
    (?=.*\d) # Contain at least one number
    (?=.*[a-z]) # Contain at least one lowercase letter
    (?=.*[A-Z]) # Contain at least one uppercase letter
    (?=.*[[:^alnum:]]) # Contain at least one symbol
  /x

  validates :password, format: PASSWORD_REQUIREMENTS
  validates_confirmation_of :password
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end

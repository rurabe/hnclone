class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_secure_password
  
  before_save {|user| user.email = email.downcase }
  validates :first_name, :presence => { message: "Please enter a first name" }
  validates :last_name, :presence => { message: "Please enter a last name" }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => { message: "Please enter a valid email" } ,
             :format => { with: VALID_EMAIL_REGEX, message: "Please enter a valid email" }, 
             :uniqueness => { case_sensitive: false, message: "That email is already registered" }
  validates :password, :presence => { message: "Please enter a password" }, :length => { minimum: 6, message: "Password must be 6 characters"}
  validates :password_confirmation, :presence => { message: "Please confirm your password" }

end

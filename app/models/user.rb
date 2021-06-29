class User < ApplicationRecord
  has_many :messages
  has_many :private_messages
    validates_presence_of :firstname
    validates_length_of :firstname, maximum: 70
  validates_presence_of :lastname
  validates_length_of :lastname, maximum: 70
    before_save { self.email = email.downcase }    
    validates_presence_of :email
    validates_length_of :email, maximum: 255    
    validates_uniqueness_of :email, case_sensitive: false    
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i 
  has_secure_password
  validates_presence_of :password
validates_length_of :password, minimum: 5

  def fullname
    return "#{firstname} #{lastname}"
  end

end
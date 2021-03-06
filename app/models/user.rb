require "digest/sha2"

#hartcodierter Superadmin mit allen Rechten: login = superuser, pw = blubb (8.mai 2013)

class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_present
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX 
  
  has_many :events, :dependent => :destroy

  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  
  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
  
  def password=(password)
    @password = password
    
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end


  private
  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
end

class Account < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  attr_accessor :password, :password_confirmation
  
  validates_presence_of :email
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => %r{.+@.+\..+}
  
  validates_presence_of :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  
  before_save :initialize_salt, :encrypt_password
  
  def authenticated?(password)
    encrypted_password == encrypt(password)
  end
  
  def remember_me!
    self.remember_token = encrypt("--#{Time.now.utc}--#{password}--")
    save(false)
  end
  
  def update_password(new_password, new_password_confirmation)
    self.password = new_password
    self.password_confirmation = new_password_confirmation
    save
  end
  
  class << self
    def authenticate(email, password)
      return nil unless account = find_by_email(email)
      return account if account.authenticated?(password)
    end
  end
  
  protected
  
  def generate_hash(string)
    Digest::SHA1.hexdigest(string)
  end
  
  def initialize_salt
    if new_record?
      self.salt = generate_hash("--#{Time.now.utc}--#{password}--")
    end
  end
  
  def encrypt_password
    return if password.blank?
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
    generate_hash("--#{salt}--#{string}--")
  end
  
  def password_required?
    encrypted_password.blank? || !password.blank?
  end  
end

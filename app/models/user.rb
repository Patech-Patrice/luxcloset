class User < ApplicationRecord
    #accessed through bcrypt which allows us to use the authenticate method

 #this method adds the password and password confirmation attributes to the model and expects the model to have a string field named password_digest while adding validations that require matching the password and password confimation attributes on creation.
  has_many :shoes, through: :designers
  has_many :handbags, through: :designers
  has_many :reviews
  
  
  validates :username, uniqueness: true,  presence: true
  validates :email, presence: true

  has_secure_password

  #Class Level Method for User(Omniauth)...Auth is request hash 
  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email], email: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end




end

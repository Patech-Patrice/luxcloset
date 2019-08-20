class User < ApplicationRecord

  has_many :shoes, through: :designers
  has_many :handbags, through: :designers
  has_many :reviews

  has_many :designers, through: :reviews
  
  validates :username, uniqueness: true,  presence: true
  validates :email, presence: true

  #accessed through bcrypt which allows us to use the authenticate method
  has_secure_password

  #Class Level Method for User(Omniauth)...Auth is request hash 
  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email], email: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end

end

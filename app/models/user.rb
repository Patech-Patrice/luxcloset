class User < ActiveRecord::Base
    #accessed through bcrypt which allows us to use the authenticate method

 #this method adds the password and password confirmation attributes to the model and expects the model to have a string field named password_digest while adding validations that require matching the password and password confimation attributes on creation.
  has_many :shoes, through: :designers
  has_many :handbags, through: :designers

  #validates :email,  presence: true, uniqueness: true
  #valiates :username, uniqueness: true, presence: true
  has_secure_password




end

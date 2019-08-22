class Designer < ApplicationRecord
 has_many :shoes, through: :users
 has_many :handbags, through: :users
 has_many :reviews
 #many_to_many
 has_many :users, through: :reviews

 validates :name, presence: true
 validates :country, presence: true

 #custom validator
 validate :not_a_duplicate

 #class level scope method
 scope :order_by_rating, -> {joins(:reviews).group(:id).order(stars: :desc)} 

 #if a designer already exists with the same designer id do not duplicate
 def not_a_duplicate
    if Designer.find_by(name: name, country: country)
        errors.add(:name, 'is already in database')
    end
 end 
  
  def name_and_country
   "#{name}- #{country} "
  end

end
   

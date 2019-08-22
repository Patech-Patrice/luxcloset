class Designer < ApplicationRecord
 has_many :shoes, through: :users
 has_many :handbags, through: :users
 has_many :reviews
 #many_to_many
 has_many :users, through: :reviews

 validates :name, presence: true
 validates :country, presence: true


 #class level scope method
 scope :order_by_rating, -> {joins(:reviews).group(:id).order(stars: :desc)} 

 
end
   

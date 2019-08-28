class Designer < ApplicationRecord
 has_many :shoes, dependent: :destroy
 has_many :handbags, dependent: :destroy
 has_many :reviews
 #many_to_many
 has_many :users, through: :reviews

 validates :name, presence: true
 validates :country, presence: true




 #class level scope method
 #scope :order_by_rating, -> {left_joins(:reviews).group(:id).order(stars: :desc)} 

 def self.alpha
    order(:name)
 end

end
   


#:dependent controls what happens to the associated objects when their owner is destroyed
#:destroy causes all the associated objects to also be destroyed.
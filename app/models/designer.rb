class Designer < ApplicationRecord
#belongs_to :user #user creates designer
has_many :shoes, through: :users
has_many :handbags, through: :users
has_many :reviews


validates :name, presence: true
validates :country, presence: true



#validate is used when a custom validator has been written in the model
#validate :not_a_duplicate

#class level scope method
scope :order_by_rating, -> {joins(:reviews).group(:id).order(stars: :desc)} 


end
   

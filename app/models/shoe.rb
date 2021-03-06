class Shoe < ApplicationRecord
belongs_to :user
belongs_to :designer, optional: true
has_many :reviews, through: :designer

validates :brand, presence: true

#custom validator
validate :not_a_duplicate

#Allows to specify attr pointing to a method checks whether a record should be built for a certain attribute hash. 
#The hash is passed to the method and it should return either true or false. 
accepts_nested_attributes_for :designer, reject_if: :designer_reject

def designer_reject(designer_attributes)
    designer_attributes['name'].blank? || designer_attributes['country'].blank?
end 

# scope :search_by_brand, -> (search_brand){where("brand > ?", search_brand)}

def self.search(params)
    shoe = Shoe.where('brand LIKE ?', "%#{params[:search]}%")
    if params[:search].present?
       shoe # returns the shoes that contain the search words
 end
end 

#def self.search(params)
    #shoe = Shoe.find_by(brand: search)
    #if params[:search].present?
    #else 
     #   Shoe.all
    #end
#end 
 
 

 
#if a shoe already exists with the same designer id and brand, do not duplicate
def not_a_duplicate
    if Shoe.find_by(brand: brand, color: color, designer_id: designer_id)
        errors.add(:brand, 'is already in database')
    end
end 

 def brand_and_color_designer
    "#{brand} - #{color} - #{designer.name}"
 end
end

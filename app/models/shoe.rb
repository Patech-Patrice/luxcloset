class Shoe < ApplicationRecord

belongs_to :user
belongs_to :designer
has_many :reviews, through: :designer

validates :brand, presence: true

#validate is used when a custom validator has been written in the model
validate :not_a_duplicate

accepts_nested_attributes_for :designer, reject_if: :designer_reject

def designer_reject(designer_attributes)
    designer_attributes['name'].blank? || designer_attributes['country'].blank?
end 

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

class Shoe < ApplicationRecord
belongs_to :user
belongs_to :designer
has_many :reviews, through: :designer


validates :brand, presence: true


accepts_nested_attributes_for :designer, reject_if: :designer_reject

def designer_reject(designer_attributes)
    designer_attributes['name'].blank? || designer_attributes['country'].blank?
end 



end

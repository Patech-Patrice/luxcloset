class Shoe < ApplicationRecord
belongs_to :user
belongs_to :designer
has_many :reviews, through: :designer


validates :brand, presence: true



accepts_nested_attributes_for :designer

end

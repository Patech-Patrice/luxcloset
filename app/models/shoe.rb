class Shoe < ApplicationRecord
belongs_to :user
belongs_to :designer

accepts_nested_attributes_for :designer

end

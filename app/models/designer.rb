class Designer < ApplicationRecord
#belongs_to :user #user creates designer
has_many :shoes, through: :users
has_many :handbags, through: :users
has_many :reviews


validates :name, presence: true

#validate is used when a custom validator has been written in the model

  def designer_attributes=(designer)
    self.designer = Designer.find_or_create_by(id: designer_id)
    self.designer.update(designer)
  end 
end 
   

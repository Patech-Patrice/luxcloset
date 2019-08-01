class Designer < ApplicationRecord
#belongs_to :user #user creates designer
has_many :shoes, through: :users
has_many :handbags, through: :users
has_many :reviews


validates :name, presence: true

#validate is used when a custom validator has been written in the model


#scope class level method to order from highest to lowest. This method changes the scope of the collection by letting a user see the designers in order from highest to lowest rated
scope :order_by_rating, -> {left_joins(:reviews).order('stars desc')}

  def designer_attributes=(designer)
    self.designer = Designer.find_or_create_by(id: designer_id)
    self.designer.update(designer)
  end


  

end 
   

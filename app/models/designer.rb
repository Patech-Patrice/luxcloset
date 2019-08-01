class Designer < ApplicationRecord
#belongs_to :user #user creates designer
has_many :shoes, through: :users
has_many :handbags, through: :users
has_many :reviews


validates :name, presence: true

#validate is used when a custom validator has been written in the model
#validate :not_a_duplicate

#scope method to order from highest to lowest
scope :order_by_rating, -> {left_joins(:reviews).order('stars desc')}

  def designer_attributes=(designer)
    self.designer = Designer.find_or_create_by(id: designer_id)
    self.designer.update(designer)
  end


  #this method shows an error when a shoe with the same designer, color,fabric and brand already exist
  #def not_a_duplicate
    #if Designer.find_by(name: name, user_id: user_id)
      #errors.add(:name, 'has already been added for that shoe')
    #end
  #end

  #def name_and_user
    #"#{name} -#{user.name}"
  #end

end 
   

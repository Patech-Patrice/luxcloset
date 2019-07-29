class Designer < ApplicationRecord
belongs_to :users
has_many :shoes, through: :users
has_many :handbags, through: :users



  def designer_attributes=(designer)
    self.designer = Designer.find_or_create_by(id: designer_id)
    self.designer.update(designer)
  end
end

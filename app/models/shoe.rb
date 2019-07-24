class Shoe < ActiveRecord::Base
belongs_to :user
belongs_to :designer

accepts_nested_attributes_for :designer

end


#def designer_id
#end
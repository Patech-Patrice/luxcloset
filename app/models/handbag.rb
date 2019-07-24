class Handbag < ActiveRecord::Base
belongs_to :user
belongs_to :designer

  validates :user_id, presence: true
  validates :designer_id, presence: true
  accepts_nested_attributes_for :designer

end

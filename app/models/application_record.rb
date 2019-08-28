#Set to true if this is an abstract class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

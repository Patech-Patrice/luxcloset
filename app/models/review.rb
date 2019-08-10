class Review < ApplicationRecord
    belongs_to :user
    belongs_to :designer , optional: true
  
    validates :title, presence: true
    validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

    #validates is used as non-custom default validations
  
    validates :designer, uniqueness: { scope: :user, message: "has already been reviewed by you"  }

    #scope class level method to order from highest to lowest. This method changes the scope of the collection by letting a user see the designers in order from highest to lowest rated
    #scope :order_by_rating, -> {left_joins(:reviews).order('stars desc')}
    
    #scope :order_by_rating, -> {joins(:reviews).group(:id).order(stars: :desc)}

  end
  
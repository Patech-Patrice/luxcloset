class CreateShoes < ActiveRecord::Migration[5.2]
    def change
      create_table :shoes do |t|
        t.string :brand
        t.string :color
        t.string :fabric
        t.belongs_to :user, foreign_key: true
        t.belongs_to :designer, foreign_key: true
        t.timestamps
      end
    end
  end

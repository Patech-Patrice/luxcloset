class AddShoeIdToShoes < ActiveRecord::Migration[5.2]
  def change
    add_reference :shoes, :shoe, index: true
  end
end

class AddProductIdToReview < ActiveRecord::Migration
  def up
    add_column :reviews, :product_id, :integer
  end

  def down
    remove_column :reviews, :product_id
  end
end

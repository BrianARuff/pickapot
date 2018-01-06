class AddRecipeToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :recipe_id, :integer
  end
end

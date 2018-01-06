class AddValuesToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :name, :string
    add_column :recipes, :description, :text
    add_column :recipes, :image, :string
  end
end

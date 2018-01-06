class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.text :ingredient_list
      t.text :instruction_list
      t.integer :user_id

      t.timestamps
    end
  end
end

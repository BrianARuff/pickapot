class RemoveValuesFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :commentable_type, :string
    remove_column :comments, :commentable_id, :string
  end
end

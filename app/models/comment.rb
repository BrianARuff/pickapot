class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :comment_entry, :recipe_id, presence: true, length: {maximum: 500, too_long: 'Comment cannot exceed 500 characters.'}
end

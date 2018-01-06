class Category < ApplicationRecord
  has_many :recipes
  belongs_to :user

  validates :name, uniqueness: true, presence: true
  validates :user_id, presence: true
end

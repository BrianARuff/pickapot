class Recipe < ApplicationRecord
  validates :ingredient_list, :name, :instruction_list, presence: true
  validates :instruction_list, :ingredient_list, presence: true
  validates :description, presence: true, uniqueness: true

  has_many :comments, dependent: :destroy
  has_many :reviews

  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader
end

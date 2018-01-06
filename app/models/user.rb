class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, uniqueness: true

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories
  has_many :reviews, dependent: :destroy

  def admin?
    role == "admin"
  end

  def guest?
    role == "guest"
  end

end

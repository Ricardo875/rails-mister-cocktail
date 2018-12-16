class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  belongs_to :type

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  mount_uploader :image, ImageUploader
end

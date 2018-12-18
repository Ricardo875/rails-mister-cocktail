class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end


class Recipe < ApplicationRecord
   validates :name, :complexity, :genre, presence: true

   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients
end

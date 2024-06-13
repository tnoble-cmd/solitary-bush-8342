class Ingredient < ApplicationRecord
   validates :name, :cost, presence: true
end

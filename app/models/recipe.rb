class Recipe < ApplicationRecord
   validates :name, :complexity, :genre, presence: true
end

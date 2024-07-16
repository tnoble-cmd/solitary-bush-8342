require "rails_helper"

RSpec.describe Recipe, type: :model do
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "total_cost" do
    it "can calculate the total cost of a recipe" do
      @recipe = Recipe.create(name: "spaghetti", complexity: 1, genre: "Italian")
      @ingredient_1 = @recipe.ingredients.create(name: "pasta", cost: 2)
      @ingredient_2 = @recipe.ingredients.create(name: "sauce", cost: 3)
      @ingredient_3 = @recipe.ingredients.create(name: "ground beef", cost: 5)

      expect(@recipe.total_cost).to eq(10)
    end
  end
end
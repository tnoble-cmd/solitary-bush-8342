require 'rails_helper'

RSpec.describe 'Recipe show page' do 

  before :each do 
    @recipe_1 = Recipe.create(name: "spaghetti", complexity: 1, genre: "Italian")
    @recipe_2 = Recipe.create(name: "tacos", complexity: 3, genre: "Mexican")

    @ingredient_1 = Ingredient.create(name: "pasta", cost: 2)
    @ingredient_2 = Ingredient.create(name: "sauce", cost: 3)
    @ingredient_3 = Ingredient.create(name: "ground beef", cost: 5)

    RecipeIngredient.create(recipe_id: @recipe_1.id, ingredient_id: @ingredient_1.id)
    RecipeIngredient.create(recipe_id: @recipe_1.id, ingredient_id: @ingredient_2.id)
    RecipeIngredient.create(recipe_id: @recipe_1.id, ingredient_id: @ingredient_3.id)
  end

  it ' goes to the correct ID when specified' do 
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_current_path("/recipes/#{@recipe_1.id}")
    
    visit "/recipes/#{@recipe_2.id}"
    expect(page).to have_current_path("/recipes/#{@recipe_2.id}")
  end

  it 'displays the recipe name' do 
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content(@recipe_1.name)
  end

  it 'displays the recipes complexity and genre' do 
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content(@recipe_1.complexity)
    expect(page).to have_content(@recipe_1.genre)
  end

  it 'displays the ingredients names for the recipe' do 
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
  end

  it 'displays the total cost of the recipe' do 
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content(@recipe_1.total_cost)
    expect(page).to have_content("Total Cost: 10")
  end
end
require 'rails_helper'

RSpec.describe "Ingredients Index" do 

  before :each do 
    @ingredient1 = Ingredient.create(name: "Flour", cost: 1.00)
    @ingredient2 = Ingredient.create(name: "Sugar", cost: 2.00)
    @ingredient3 = Ingredient.create(name: "Eggs", cost: 3.00)
    @ingredient4 = Ingredient.create(name: "Milk", cost: 4.00)
    @ingredient5 = Ingredient.create(name: "Butter", cost: 5.00)
    @ingredient6 = Ingredient.create(name: "Pasta", cost: 6.00)
  end

  it "has the correct URL" do
    visit '/ingredients'

    expect(current_path).to eq('/ingredients')
  end

  it "can see all ingredients and costs" do 
    visit '/ingredients'
    #checks that name is displayed.
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient4.name)
    expect(page).to have_content(@ingredient5.name)
    expect(page).to have_content(@ingredient6.name)

    #checks that cost is displayed
    expect(page).to have_content(@ingredient1.cost)
    expect(page).to have_content(@ingredient2.cost)
    expect(page).to have_content(@ingredient3.cost)
    expect(page).to have_content(@ingredient4.cost)
    expect(page).to have_content(@ingredient5.cost)
    expect(page).to have_content(@ingredient6.cost)

    #checks that page renders proper formatting for ingredient name and cost
    expect(page).to have_content("Milk: 4")
  end

  it "can see ingredients in alphabetical order" do 
    visit '/ingredients'

    #checks that ingredients are displayed in alphabetical order
    expect(page).to have_content("Butter")
    expect(page).to have_content("Eggs")
    expect(page).to have_content("Flour")
    expect(page).to have_content("Milk")
    expect(page).to have_content("Pasta")
    expect(page).to have_content("Sugar")
  end
end
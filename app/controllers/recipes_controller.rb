class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    #find the recipe by passed in id from the form, and the ingredient by name from the form, then search for the ingredient by name w/find_by.
    @recipe = Recipe.find(params[:id])
    @ingredient_name = params[:name]
    @ingredient = Ingredient.find_by(name: @ingredient_name)

    #conditional to check if ingredient exists, if it does, add it to the recipe. Else, flash an error and redirect to the recipe show page. (rendered on show.html.erb)
    if @ingredient
      @recipe.ingredients << @ingredient
      redirect_to "/recipes/#{params[:id]}"
    else
      flash[:error] = "Ingredient not found"
      redirect_to "/recipes/#{params[:id]}"
    end
  end
end
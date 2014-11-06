class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.save
    redirect_to @recipe
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :procedure)
  end

end

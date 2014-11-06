class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.save
    redirect_to recipe_path(@recipe.id)
    # redirect_to @recipe
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :procedure)
  end

end

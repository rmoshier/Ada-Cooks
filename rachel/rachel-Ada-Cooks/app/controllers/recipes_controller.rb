class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = RecipeForm.new(params[:recipe_form])

    @recipe.submit
    redirect_to recipe_path(@recipe.recipe.id)
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

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :procedure)
  end

end

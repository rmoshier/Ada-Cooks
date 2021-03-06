class RecipeForm

  def initialize(attributes) #the argument is params, which is a hash
    @attributes = attributes
  end

  def recipe # same as attr_reader
    @recipe
  end

  def submit # this saves attributes into models
    # create an instance of Recipe class
    # create recipe ingredients for each id in ingredients key
    @recipe = Recipe.create(
    name:        @attributes[:name],
    description: @attributes[:description],
    procedure:   @attributes[:procedure]
    )

    @attributes[:ingredients].each do |id|
      RecipeIngredient.create(ingredient_id: id, recipe_id: @recipe.id)
    end
    @recipe.valid?
  end

  def destroy(recipe_id)
    @recipe = Recipe.find(recipe_id)
    @recipe.update(
    name:        @attributes[:name],
    description: @attributes[:description],
    procedure:   @attributes[:procedure]
    )

    @attributes[:ingredients].each do |id|
      RecipeIngredient.create(ingredient_id: id, recipe_id: @recipe.id)
    end
    @recipe.valid?
  end

end

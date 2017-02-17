class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.steps.build
  end

  def create
    @recipe = Recipe.new(recipe_ingredient_step_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  private

  def recipe_ingredient_step_params
    params.require(:recipe).permit(:title, :content,
                                   ingredient_attributes: [:name, :amount],
                                   step_attributes: [:step_order, :content])

  end
end

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
                                   ingredients_attributes: [:id, :name, :amount, :_destroy],
                                   steps_attributes: [:id, :step_order, :content, :_destroy])

  end
end

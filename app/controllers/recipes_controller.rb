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

  end
end

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
      redirect_to recipes_path, notice: "新增食譜成功！"
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_ingredient_step_params)
      redirect_to recipes_path, notice: "修改食譜成功！"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, alert: "食譜已刪除！"
  end

  private

  def recipe_ingredient_step_params
    params.require(:recipe).permit(:title, :content,
                                   ingredients_attributes: [:id, :name, :amount, :_destroy],
                                   steps_attributes: [:id, :step_order, :content, :_destroy])

  end
end

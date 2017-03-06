class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_recipe_id, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.steps.build
    @photo = @recipe.photos.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_ingredient_step_params)

    if @recipe.save
      redirect_to recipes_path, notice: "新增食譜成功！"
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments
  end

  def edit
  end

  def update
    if @recipe.update(recipe_ingredient_step_params)
      redirect_to recipes_path, notice: "修改食譜成功！"
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, alert: "食譜已刪除！"
  end

  private

  def recipe_ingredient_step_params
    params.require(:recipe).permit(:title, :content,
                                   ingredients_attributes: [:id, :name, :amount, :_destroy],
                                   steps_attributes: [:id, :step_order, :content, :_destroy],
                                   photos_attributes: [:id, :image, :remote_image_url, :_destroy])

                                   #photos_attributes: [:id, :image, :remote_image_url, :remove_image]

  end

  def find_recipe_id
    @recipe = current_user.recipes.find(params[:id])
  end
end

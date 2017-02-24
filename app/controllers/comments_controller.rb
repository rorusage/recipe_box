class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)

    if @comment.save
      redirect_to recipe_path(@recipe), notice: "新增評論成功！"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end

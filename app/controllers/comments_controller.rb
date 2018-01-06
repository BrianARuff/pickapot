class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]


  def edit;
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html {redirect_to recipe_path(id: @comment.recipe_id), notice: 'Comment posted.'}
      else
        format.html {redirect_to recipe_path(id: @comment.recipe_id), notice: 'Comment failed to post!'}
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html {redirect_to recipe_path(id: @comment.recipe_id), notice: 'Comment was updated!'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to recipe_path(id: @comment.recipe_id), notice: 'Comment deleted!'}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_entry, :recipe_id, :user_id, :user_name, :name)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end

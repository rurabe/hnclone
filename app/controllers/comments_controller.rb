class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "Thanks for your comment!"
      redirect_to story_path(@comment.story_id)
    else 
      flash[:alert] = @story.errors.messages
      redirect_to story_path(@comment.story_id)
    end
  end
  
  def show
    @comment = Comment.find_by_id(params[:id])
    @story = Story.find_by_id(@comment.story_id)
    @new_comment = Comment.new
  end
  
end

class StoriesController < ApplicationController
  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:success] = "Thanks for sharing!"
      redirect_to stories_path
    else 
      flash[:alert] = @story.errors.messages
      redirect_to new_story_path
    end
  end

  def new
    @story = Story.new
  end
  
  def update
    Story.update(params[:id], params[:story])
    redirect_to current_user
  end
  
  def edit
    @story = Story.find_by_id(params[:id])
  end

  def index
    @stories = Story.scoped.page(params[:page]).per(20)
  end
  
  def show
    @story = Story.find_by_id(params[:id])
    @comments = @story.comments
    @comment = Comment.new
  end
end

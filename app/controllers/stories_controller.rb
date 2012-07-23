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

  def index
    @stories = Story.scoped.page(params[:page]).per(20)
  end
end

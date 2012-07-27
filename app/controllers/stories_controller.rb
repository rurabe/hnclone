class StoriesController < ApplicationController
  before_filter :find_story_by_id, only: [:update, :edit, :show]
  before_filter :signed_in_user , only: [:create, :new, :update, :edit]
  before_filter :authorized_user, only: [:edit, :update]
  before_filter :still_editable, only: [:edit]
  before_filter :init_vote, only: [:index, :show]

  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:success] = "Thanks for sharing!"
      redirect_to stories_path
    else
      flash.now[:alert] = @story.errors.messages
      render "new"
    end
  end

  def new
    @story = Story.new
  end

  def update
    @story.update_attributes(params[:story])
    redirect_to current_user
  end

  def edit

  end

  def index
    @stories = Story.joins_with_votes.group('stories.id').order_by_votes_over_time.page(params[:page]).per(20)
  end

  def show
    @comments = @story.comments
    @comment = Comment.new
  end

  private

    def find_story_by_id
      @story = Story.find_by_id(params[:id])
    end

    def authorized_user
      redirect_to root_path unless @story.user == current_user
    end

    def still_editable
      redirect_to story_path(@story) unless Time.now < @story.created_at + 15.minutes
    end

    def init_vote
      @vote = Vote.new
    end
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end
  
  def show
    @stories = current_user.stories
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome #{@user.first_name}!"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.messages
      redirect_to new_user_path
    end
  end
end

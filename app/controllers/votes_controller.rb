class VotesController < ApplicationController
  def create
    @vote = Vote.new(params[:vote])
    @vote.save
    redirect_to root_path
  end
end

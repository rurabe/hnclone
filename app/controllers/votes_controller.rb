class VotesController < ApplicationController
  def create
    @vote = Vote.new(params[:vote])
    @vote.save
    Karma.create(params[:karma])
    #redirect_to :back
  end
end

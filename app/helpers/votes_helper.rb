module VotesHelper
  def show_vote(voteable)
    signed_in? && current_user != voteable.user  && !already_voted?(voteable)
  end

  def can_downvote?
    current_user.karmas_received.length > 100
  end

  def already_voted?(voteable)
    !voteable.votes.where(:user_id => current_user.id ).empty?
  end

  def score(voteable)
    voteable.votes.where(:value => 1).length - voteable.votes.where(:value => -1).length
  end
end

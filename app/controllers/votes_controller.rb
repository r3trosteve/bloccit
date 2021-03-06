class VotesController < ApplicationController
	before_filter :setup

  def up_vote
    # Just like other controllers, grab the parent objects
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    # Just like other controllers, grab the parent objects
    update_vote(-1)
    redirect_to :back
  end

  private

  def setup
  	@topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    authorize! :create, Vote, message: "You need to be a user to do that."
    # Look for an existing vote by this person so we don't create multiple
    @vote = @post.votes.where(user_id: current_user.id).first
  end

   def update_vote(new_value)
    if @vote # if it exists, update it
      @vote.update_attribute(:value, new_value)
    else # create it
      @vote = current_user.votes.create(value: new_value, post: @post)
    end
  end


# replacement to attr_accessible for rails 4 - goes in the controller instead of model
	private
	def vote_params
		params.require(:vote).permit(:value, :post)
	end
end

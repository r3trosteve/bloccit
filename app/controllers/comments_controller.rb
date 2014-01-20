class CommentsController < ApplicationController
	respond_to :html

	def create
		# declare instance variables for each object
	  @topic = Topic.find(params[:topic_id])
	  @post = @topic.posts.find(params[:post_id])
	  @comments = @post.comments

	  @comment = current_user.comments.build(comment_params)
	  @comment.post = @post

	  authorize! :create, @comment, message: "You need to be signed up to do that."

	  if @comment.save
	    flash[:notice] = "Comment was saved."
	  else
	    flash[:error] = "There was an error saving the comment. Please try again."
	  end

	  respond_with(@comment) do |f|
	  		f.html { redirect_to [@topic, @post] }
	  end
	end

	private
	def comment_params
		params.required(:comment).permit(:body, :post)
	end
end

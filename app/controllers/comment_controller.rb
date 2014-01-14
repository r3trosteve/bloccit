class CommentController < ApplicationController

	private
	def comment_params
		params.required(:comment).permit(:body)
	end
end

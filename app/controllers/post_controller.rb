class PostController < ApplicationController

	private
	def post_params
		params.required(:post).permit(:title, :body)
	end
end

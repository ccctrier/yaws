class PostsController < ApplicationController
def feed
		@posts = Post.all(:limit => 20) 

		respond_to do |format|
			format.html
			format.rss { render :layout => false } #index.rss.builder
		end
end
end
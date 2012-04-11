class PostsController < ApplicationController
def feed
		raise "No section specified!" if params[:section].nil? 
		@posts = Post.where(:published => true, :section => params[:section])

		respond_to do |format|
			format.html
			format.rss { render :layout => false } #index.rss.builder
		end
end
end
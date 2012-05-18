class PostsController < ApplicationController

	def index 
		@posts = Post.all
		
		respond_to do |format|
			format.html
		end    
	end
		
	def feed
			raise "No section specified!" if params[:section].nil? 
			@posts = Post.where(:published => true, :section => params[:section]).reverse
	
			respond_to do |format|
				format.html
				format.rss { render :layout => false } #index.rss.builder
				format.atom { render :layout => false } # index.atom.builder
			end
	end
end
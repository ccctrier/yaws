atom_feed :language => 'de-DE' do |feed|
  feed.title "CCC Trier"
  feed.updated @posts.first.created_at

  @posts.each do |post|
	feed.entry post do |entry|
	  entry.title post.title
	  entry.content post.content, :type => 'html'

	  #entry.user_id do |user_id|
		#user_id.name post.user_id
	  #end
	end
  end
end
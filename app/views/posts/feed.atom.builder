atom_feed :language => 'de-DE' do |feed|
  feed.title "CCC Trier"
  feed.updated @posts.first.created_at

  @posts.each do |post|
	feed.entry post do |entry|
	  entry.title post.title
	  entry.content post.content, :type => 'html'
	  entry.tag!('app:edited', Time.now)

	entry.author do |author|
  		author.name("CCC Trier")
	end
	end
  end
end
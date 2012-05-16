xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
	xml.title "CCC Trier"
	xml.link posts_url
	xml.description "Yes, we hack!"
	xml.language "de-de"
	xml.copyright "Copyright is a lie!"
	xml.image do
		xml.url "/images/chaosporta.png"
		xml.title "CCC Trier"
		xml.link "http://www.ccc-trier.de"
		end
		

	for post in @posts
	  xml.item do
		xml.title post.title
		xml.description post.content
		xml.link post_url(post)
		xml.author "CCC Trier, anfrage@ccc-trier.de"
		xml.guid post_url(post)
		xml.pubDate post.created_at.to_s(:rfc822)
	  end
	end
  end
end
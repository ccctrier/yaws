class Backend::PlanetEntry < ActiveRecord::Base
  attr_accessible :guid, :published_at, :summary, :title, :url
  
  def self.update_from_feeds
    feed_urls = Backend::Planet.all.map do |feed|
      puts feed.url
      feed.url
    end
    feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
    feeds.each do |feed_url, feed|
      add_entries(feed.entries)
    end
  end
  
  private
  
  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :guid => entry.id  
        create!(  
          :title        => entry.title,
          :summary      => entry.summary, 
          :url          => entry.url,
          :published_at => entry.published,  
          :guid         => entry.id  
        )  
      end
    end
  end
end

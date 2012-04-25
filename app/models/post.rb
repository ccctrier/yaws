class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :content, :published, :section
  before_save :set_publishing_date
  
  validates :title, :presence => true
  
  private
  
    def set_publishing_date
      self.published_at = Time.now if self.published & self.published_at.nil?
    end
  
end
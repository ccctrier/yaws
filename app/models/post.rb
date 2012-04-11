class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :content, :published, :section
  
  validates :title, :presence => true
end
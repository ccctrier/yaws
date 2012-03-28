class Event < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :presence => true
  validates :start_date, :presence => true
end

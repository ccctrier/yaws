class Backend::Planet < ActiveRecord::Base
  attr_accessible :url
  
  validates_format_of :url, :with => URI::regexp
end

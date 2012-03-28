class User < ActiveRecord::Base
  acts_as_authentic
  has_many :posts
  has_many :events
  
  def isAdmin
    self.role == Role.where(:name => "admin").first.id
  end
  
  def isUser
    self.role == Role.where(:name => "user").first.id
  end
  
  def isRole?(user_role)
    self.role == Role.where(:name => user_role).first.id
  end
end

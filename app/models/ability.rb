class Ability
	include CanCan::Ability
	
	def initialize(user)
		user ||= User.new # guest user (not logged in)
		if user.isAdmin
			can :manage, :all
		elsif user.isUser
			can :read, :all
		else
			can :read, :user
		end
	end

end

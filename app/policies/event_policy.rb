class EventPolicy < ApplicationPolicy
		attr_reader :user, :event

		def resolve
			scope
		end

		def initialize(user, event)
			@user = user
			@event = event
		end

		def show?
			 # @event.user_role == 'owner'


		end

	


end

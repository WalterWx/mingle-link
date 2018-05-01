class Event < ApplicationRecord
	has_many :events_users
	has_many :users, through: :events_users
	accepts_nested_attributes_for :events_users

validates :title, :description, :datetime_start, :datetime_start, :location, presence: true
validates :title, uniqueness: true

	has_many :groups
end
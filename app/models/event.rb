class Event < ApplicationRecord
	has_many :events_users
	has_many :users, through: :events_users
validates :title, :description, :datetime_start, :datetime_start, :location, presence: true
validates :title, uniqueness: true

end
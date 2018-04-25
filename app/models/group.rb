class Group < ApplicationRecord

	validates :title, :description, :event_id, presence: true
	validates :title, uniqueness: true

	has_and_belongs_to_many :events
end

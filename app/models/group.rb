class Group < ApplicationRecord

	validates :title, :description, :event_id, presence: true
	validates :title, uniqueness: true

	belongs_to :event
end

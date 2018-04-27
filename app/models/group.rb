class Group < ApplicationRecord

	validates :title, :description, :event_id, presence: true
	validates :title, uniqueness: true
	has_many :groups_users
	has_many :users, through: :groups_users
	belongs_to :event
end

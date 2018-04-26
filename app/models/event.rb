class Event < ApplicationRecord

validates :title, :description, :datetime_start, :datetime_start, :location, presence: true
validates :title, uniqueness: true

	has_many :groups

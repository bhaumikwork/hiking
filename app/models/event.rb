class Event < ActiveRecord::Base
	has_one :emergency_info
	has_one :picture_plan
	has_many :plan_itineraries
	has_many :galleries
	has_one :other_info
end

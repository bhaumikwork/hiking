class Event < ActiveRecord::Base
	has_one :emergency_info
	has_one :picture_plan
	has_many :plan_itineraries
end

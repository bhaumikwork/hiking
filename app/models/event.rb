class Event < ActiveRecord::Base
	has_one :emergency_info
	has_one :picture_plan
	has_one :plan_itineraries
end

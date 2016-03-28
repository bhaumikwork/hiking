class Event < ActiveRecord::Base
	has_one :emergency_info, dependent: :destroy
	has_one :picture_plan, dependent: :destroy
	has_many :plan_itineraries, dependent: :destroy
	has_many :galleries, dependent: :destroy
	has_one :other_info, dependent: :destroy
end

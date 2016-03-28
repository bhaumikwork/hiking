class Event < ActiveRecord::Base
	has_one :emergency_info, dependent: :destroy
	has_one :picture_plan, dependent: :destroy
	has_many :plan_itineraries, dependent: :destroy
	has_many :galleries, dependent: :destroy
	has_one :other_info, dependent: :destroy


	def self.is_empty(value)
		if value.present?
			return value
		else
			return "<span style='padding-left: 20px;'>-</span>".html_safe
		end
	end
end

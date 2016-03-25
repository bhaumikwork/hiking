class PlanItinerary < ActiveRecord::Base
  belongs_to :event
  has_many :plan_itinerary_facilities
  accepts_nested_attributes_for :plan_itinerary_facilities, allow_destroy: true
end

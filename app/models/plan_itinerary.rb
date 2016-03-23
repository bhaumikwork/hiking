class PlanItinerary < ActiveRecord::Base
  belongs_to :event
  has_many :plan_itinerary_facilities
end

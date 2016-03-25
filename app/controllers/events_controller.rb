class EventsController < ApplicationController
	include ApplicationHelper
	before_action :set_event, except: [:basic_info, :save_basic_info]

	def basic_info
		@event = Event.new
	end

	def save_basic_info
		@event = Event.new(event_params)
		if @event.save
			respond_to do |format|
	    	format.html { redirect_to emergency_info_event_path(@event), notice: "Basic info saved." }
	    	format.js
	    end
		else
	  	render 'basic_info'
		end
	end

	def emergency_info
		@emergency_info = @event.build_emergency_info
	end

	def save_emergency_info
		@emergency_info = @event.build_emergency_info(emergency_info_params)
		if @emergency_info.save
			respond_to do |format|
	    	format.html { redirect_to picture_plan_event_path(@event), notice: "Imergency info saved." }
	    	format.js
	    end
	  else
	  	render 'emergency_info'
		end
	end

	def picture_plan
		@picture_plan = @event.build_picture_plan
	end

	def save_picture_plan
		@picture_plan = @event.build_picture_plan(picture_plan_params)
		if @picture_plan.save
			respond_to do |format|
	    	format.html { redirect_to plan_itinerary_event_path(@event) }
	    	format.js
	    end
	  else
	  	render 'picture_plan'
		end
	end

	def plan_itinerary
		@plan_itinerary = @event.plan_itineraries.new
		@total_day = date_difference(@event.start_date, @event.end_date)
	end

	def save_plan_itinerary
		success = params[:plan_itinerary].each_with_index do |p, i|
			@plan_itinerary = @event.plan_itineraries.new(plan_itinerary_params(i))
			@plan_itinerary.save
		end
		if success
			respond_to do |format|
	    	format.html { redirect_to gallery_event_path(@event) }
	    	format.js
	    end
	  else
	  	render 'picture_plan'
		end
	end

	def gallery
	end

	def show
	end


	private

	def event_params
    params.require(:event).permit(:trip_name, :trip_description, :trip_location, :contact_person_name, :contact_person_mobile, :contact_person_email, :start_date, :end_date, :max_participant)
	end

	def emergency_info_params
    params.require(:emergency_info).permit(:going_person_name, :start_location, :finish_location, :planned_route, :transportation, :expected_departure, :expected_return, :freak_out_time, :communications, :in_reach_map, :local_contact_email, :managing_agency, :event_id)
	end

	def picture_plan_params
    params.require(:picture_plan).permit(:trip_goal, :planning_resources, :transport_time_to_trailhead, :direction_out, :fee, :event_id, facility_and_cautions_attributes:[:fc_type, :fc_value, :_destroy, :id])
	end

	def plan_itinerary_params(i)
    params[:plan_itinerary][i].permit(:hiking_day, :plan_start, :plan_finish, :daylight, :moonlight, :water_availability, :hammock_trees, :fishing, :expected_weather, :geocache)
	end

	def set_event
		@event = Event.includes(:emergency_info).find(params[:id])
	end
end

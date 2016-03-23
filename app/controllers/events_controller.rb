class EventsController < ApplicationController
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
	    	format.html { redirect_to jh }
	    	format.js
	    end
	  else
	  	render 'picture_plan'
		end
	end


	private

	def event_params
    params.require(:event).permit(:trip_name, :trip_description, :trip_location, :contact_person_name, :contact_person_mobile, :contact_person_email, :start_date, :end_date, :max_participant)
	end

	def emergency_info_params
    params.require(:emergency_info).permit(:going_person_name, :start_location, :finish_location, :planned_route, :transportation, :expected_departure, :expected_return, :freak_out_time, :communications, :in_reach_map, :local_contact_email, :managing_agency)
	end

	def picture_plan_params
    params.require(:picture_plan).permit(:trip_goal, :planning_resources, :transport_time_to_trailhead, :direction_out, :fee, facility_and_cautions_attributes:[:type, :value, :_destroy, :id])
	end

	def set_event
		@event = Event.find(params[:id])
	end
end

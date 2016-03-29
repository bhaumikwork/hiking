class EventsController < ApplicationController
	include ApplicationHelper
	before_action :set_event, except: [:basic_info, :save_basic_info]
	# before_action :set_sub_info, except: [:basic_info, :save_basic_info]

	def basic_info
		@event = Event.new
	end

	def save_basic_info
		@event = Event.new(event_params)
		if @event.save
			respond_to do |format|
	    	format.html { redirect_to emergency_info_event_path(@event) }
	    	format.js
	    end
		else
	  	render 'basic_info'
		end
	end

	def edit_basic_info
	end

	def update_basic_info
		if @event.update_attributes(event_params)
			respond_to do |format|
	    	format.html { redirect_to edit_emergency_info_event_path }
	    	format.js
	    end
		else
	  	render 'edit_basic_info'
		end
	end

	def emergency_info
		@emergency_info = @event.build_emergency_info
	end

	def save_emergency_info
		@emergency_info = @event.build_emergency_info(emergency_info_params)
		if @emergency_info.save
			respond_to do |format|
	    	format.html { redirect_to picture_plan_event_path(@event) }
	    	format.js
	    end
	  else
	  	render 'emergency_info'
		end
	end

	def edit_emergency_info
		@emergency_info = @event.emergency_info
	end

	def update_emergency_info
		@emergency_info = @event.emergency_info
		if @emergency_info.update_attributes(emergency_info_params)
			respond_to do |format|
	    	format.html { redirect_to edit_picture_plan_event_path }
	    	format.js
	    end
	  else
	  	render 'edit_emergency_info'
		end
	end

	def picture_plan
		@picture_plan = @event.build_picture_plan
		@facility_caution = FacilityAndCaution.new
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

	def edit_picture_plan
		@picture_plan = @event.picture_plan
		@facility_caution = @picture_plan.facility_and_cautions
	end

	def update_picture_plan
		@picture_plan = @event.picture_plan
		if @picture_plan.update_attributes(picture_plan_params)
			respond_to do |format|
	    	format.html { redirect_to edit_plan_itinerary_event_path }
	    	format.js
	    end
	  else
	  	render 'edit_picture_plan'
		end
	end

	def plan_itinerary
		@plan_itinerary = @event.plan_itineraries.new
		@total_day_ary = get_date_between(@event.start_date, @event.end_date)
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
	  	render 'plan_itinerary'
		end
	end

	def edit_plan_itinerary
		@plan_itinerary = @event.plan_itineraries
		@total_day_ary = get_date_between(@event.start_date, @event.end_date)
	end

	def update_plan_itinerary
	end

	def gallery
		@gallery = @event.galleries.new
	end

	def save_gallery
		success = params[:gallery].each_with_index do |p, i|
			@gallery = @event.galleries.new(gallery_params(i))
			@gallery.save
		end
		if success
			respond_to do |format|
	    	format.html { redirect_to other_info_event_path(@event) }
	    	format.js
	    end
	  else
	  	render 'gallery'
		end
	end

	def other_info
		@other_info = @event.build_other_info
	end

	def save_other_info
		@other_info = @event.build_other_info(other_info_params)
		if @other_info.save
			respond_to do |format|
	    	format.html { redirect_to review_info_event_path(@event) }
	    	format.js
	    end
	  else
	  	render 'other_info'
		end
	end

	def review_info
	end

	def save_review_info
		if params[:commit] == "Publish"
			redirect_to publish_trip_event_path(@event)
		else
			redirect_to root_path
		end
	end

	def destroy
		if @event.destroy
			redirect_to root_path, notice: "Record was deleted successfully."
		else
			redirect_to root_path, notice: "Something went wrong."
		end
	end

	def publish_trip
	end

	def show
	end

	def download_pdf
		respond_to do |format|
      format.pdf do
        render :pdf         => 'download_pdf',
               :page_size   => 'A4',
               :layout => 'application.html'
      end
    end
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

	def gallery_params(i)
    params[:gallery][i].permit(:trip_image)
	end

	def other_info_params
    params.require(:other_info).permit(:post_trip, :trip_note, :trip_status)
	end

	def set_event
		@event = Event.includes(:emergency_info).find_by(id: params[:id])
	end

	# def set_sub_info
	# 	@sub_info = @event.vent.includes(:emergency_info).find_by(id: params[:id])
	# end
end

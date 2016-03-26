# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160326054907) do

  create_table "emergency_infos", force: :cascade do |t|
    t.string   "going_person_name"
    t.string   "contact_email"
    t.text     "start_location"
    t.text     "finish_location"
    t.text     "planned_route"
    t.string   "transportation"
    t.datetime "expected_departure"
    t.datetime "expected_return"
    t.string   "freak_out_time"
    t.text     "communications"
    t.text     "in_reach_map"
    t.string   "local_contact_email"
    t.string   "managing_agency"
    t.integer  "event_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "emergency_infos", ["event_id"], name: "index_emergency_infos_on_event_id"

  create_table "events", force: :cascade do |t|
    t.string   "trip_name"
    t.text     "trip_description"
    t.text     "trip_location"
    t.string   "contact_person_name"
    t.string   "contact_person_mobile"
    t.string   "contact_person_email"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "max_participant"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "facility_and_cautions", force: :cascade do |t|
    t.string   "fc_type"
    t.string   "fc_value"
    t.integer  "picture_plan_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "facility_and_cautions", ["picture_plan_id"], name: "index_facility_and_cautions_on_picture_plan_id"

  create_table "galleries", force: :cascade do |t|
    t.string   "trip_image"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "galleries", ["event_id"], name: "index_galleries_on_event_id"

  create_table "other_infos", force: :cascade do |t|
    t.string   "post_trip"
    t.string   "trip_note"
    t.string   "trip_status"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "other_infos", ["event_id"], name: "index_other_infos_on_event_id"

  create_table "picture_plans", force: :cascade do |t|
    t.text     "trip_goal"
    t.text     "transport_time_to_trailhead"
    t.string   "direction_out"
    t.string   "fee"
    t.text     "planning_resources"
    t.integer  "event_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "picture_plans", ["event_id"], name: "index_picture_plans_on_event_id"

  create_table "plan_itineraries", force: :cascade do |t|
    t.datetime "hiking_day"
    t.text     "plan_start"
    t.text     "plan_finish"
    t.string   "daylight"
    t.string   "moonlight"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "water_availability"
    t.string   "hammock_trees"
    t.string   "fishing"
    t.string   "expected_weather"
    t.string   "geocache"
  end

  add_index "plan_itineraries", ["event_id"], name: "index_plan_itineraries_on_event_id"

  create_table "plan_itinerary_facilities", force: :cascade do |t|
    t.string   "facility_type"
    t.text     "facility_description"
    t.integer  "plan_itinerary_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "plan_itinerary_facilities", ["plan_itinerary_id"], name: "index_plan_itinerary_facilities_on_plan_itinerary_id"

end

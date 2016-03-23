class CreatePlanItineraryFacilities < ActiveRecord::Migration
  def change
    create_table :plan_itinerary_facilities do |t|
      t.string :facility_type
      t.text :facility_description
      t.references :plan_itinerary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

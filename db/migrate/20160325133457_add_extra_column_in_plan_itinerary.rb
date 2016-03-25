class AddExtraColumnInPlanItinerary < ActiveRecord::Migration
  def change
  	change_table :plan_itineraries do |t|
      t.string :water_availability
      t.string :hammock_trees
      t.string :fishing
      t.string :expected_weather
      t.string :geocache
    end
  end
end

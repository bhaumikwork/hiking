class CreatePlanItineraries < ActiveRecord::Migration
  def change
    create_table :plan_itineraries do |t|
      t.datetime :hiking_day
      t.text :plan_start
      t.text :plan_finish
      t.string :daylight
      t.string :moonlight
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

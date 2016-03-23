class CreatePicturePlans < ActiveRecord::Migration
  def change
    create_table :picture_plans do |t|
      t.text :trip_goal
      t.text :transport_time_to_trailhead
      t.string :direction_out
      t.string :fee
      t.text :planning_resources
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :trip_name
      t.text :trip_description
      t.text :trip_location
      t.string :contact_person_name
      t.string :contact_person_mobile
      t.string :contact_person_email
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_participant

      t.timestamps null: false
    end
  end
end

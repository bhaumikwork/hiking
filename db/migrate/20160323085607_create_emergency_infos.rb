class CreateEmergencyInfos < ActiveRecord::Migration
  def change
    create_table :emergency_infos do |t|
      t.string :going_person_name
      t.string :contact_email
      t.text :start_location
      t.text :finish_location
      t.text :planned_route
      t.string :transportation
      t.datetime :expected_departure
      t.datetime :expected_return
      t.string :freak_out_time
      t.text :communications
      t.text :in_reach_map
      t.string :local_contact_email
      t.string :managing_agency
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

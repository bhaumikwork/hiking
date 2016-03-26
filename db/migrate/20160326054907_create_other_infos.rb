class CreateOtherInfos < ActiveRecord::Migration
  def change
    create_table :other_infos do |t|
      t.string :post_trip
      t.string :trip_note
      t.string :trip_status
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

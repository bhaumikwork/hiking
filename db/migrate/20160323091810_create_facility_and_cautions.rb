class CreateFacilityAndCautions < ActiveRecord::Migration
  def change
    create_table :facility_and_cautions do |t|
      t.string :fc_type
      t.string :fc_value
      t.references :picture_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class PicturePlan < ActiveRecord::Base
  belongs_to :event
  has_many :facility_and_cautions
  accepts_nested_attributes_for :facility_and_cautions, allow_destroy: true
end

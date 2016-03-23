class PicturePlan < ActiveRecord::Base
  belongs_to :event
  has_many :facility_and_cautions
end

class Facility < ApplicationRecord
  belongs_to :facility_category
  has_many :spaces

  mount_uploader :image, FacilityImageUploader
end

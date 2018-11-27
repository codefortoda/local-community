class Space < ApplicationRecord
  belongs_to :facility
  validates :name, presence: true

  mount_uploader :image, SpaceImageUploader
end

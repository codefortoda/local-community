class Group < ApplicationRecord
  belongs_to :user
  has_many :events

  mount_uploader :image, GroupImageUploader

  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
end

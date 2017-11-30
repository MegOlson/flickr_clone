class UserTag < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  validates_presence_of :image, :user

  scope :recent, -> { order("created_at DESC").limit(3) }
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  validates_presence_of :user, :image, :content

  scope :chronological, -> { order("created_at ASC") }
end

class Category < ActiveRecord::Base
  has_and_belongs_to_many :images
  validates_presence_of :name
  validates_uniqueness_of :name

  scope :alphabetical, -> { order("name ASC") }
end

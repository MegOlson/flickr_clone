class User < ApplicationRecord
  has_many :images
  has_many :favorites
  has_many :comments
  has_many :user_tags
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.is_admin
  end

  def get_favorite(image)
    self.favorites.where(image: image).take
  end

  def get_tag(image)
    self.user_tags.where(image: image).take
  end
end

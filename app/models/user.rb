class User < ApplicationRecord
  has_many :images
  has_many :favorites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def get_favorite(image)
    self.favorites.where(image: image).take
  end
end

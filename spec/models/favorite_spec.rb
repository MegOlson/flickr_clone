require "rails_helper"

describe Favorite do
  it { should belong_to :user }
  it { should belong_to :image }
  it { should validate_presence_of :user }
  it { should validate_presence_of :image }

  describe ".recent" do
    it "should find 3 most recent favorited images" do
      image1 = FactoryBot.create(:image)
      image2 = FactoryBot.create(:image, user: image1.user)
      image3 = FactoryBot.create(:image, user: image1.user)
      image4 = FactoryBot.create(:image, user: image1.user)
      favorite1 = image1.user.favorites.create(image: image1)
      favorite2 = image1.user.favorites.create(image: image2)
      favorite3 = image1.user.favorites.create(image: image4)
      expect(Favorite.recent).to eq ([favorite3, favorite2, favorite1])
    end
  end
end

require "rails_helper"

describe UserTag do
  it { should belong_to :user }
  it { should belong_to :image }
  it { should validate_presence_of :user }
  it { should validate_presence_of :image }

  describe ".recent" do
    it "should return the 3 most recent user tags" do
      image1 = FactoryBot.create(:image)
      image2 = FactoryBot.create(:image, user: image1.user)
      image3 = FactoryBot.create(:image, user: image1.user)
      image4 = FactoryBot.create(:image, user: image1.user)
      user_tag1 = image1.user.user_tags.create(image: image1)
      user_tag2 = image1.user.user_tags.create(image: image2)
      user_tag3 = image1.user.user_tags.create(image: image4)
      expect(UserTag.recent).to eq ([user_tag3, user_tag2, user_tag1])
    end
  end
end

require 'rails_helper'

describe Category do
  it { should have_and_belong_to_many :images }
  it { should validate_presence_of :name }

  describe ".alphabetical" do
    it "should sort categories alphabetically" do
      category1 = FactoryBot.create(:category)
      category2 = FactoryBot.create(:category, name: "Animals")
      category3 = FactoryBot.create(:category, name: "Zoo")
      expect(Category.alphabetical).to eq ([category2, category1, category3])
    end
  end


  describe ".popular" do
    it "orders categories by number of images" do
      category1 = FactoryBot.create(:category)
      category2 = FactoryBot.create(:category, name: "Animals")
      image1 = FactoryBot.create(:image)
      image2 = FactoryBot.create(:image, user: image1.user)
      category1.images.push(image1)
      category1.images.push(image2)
      category2.images.push(image1)
      expect(Category.popular.first.id).to eq (category1.id)
    end
  end

end

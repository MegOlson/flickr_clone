require "rails_helper"

describe Comment do
  it { should belong_to :user }
  it { should belong_to :image }
  it { should validate_presence_of :user }
  it { should validate_presence_of :image }
  it { should validate_presence_of :content }

  describe ".chronological" do
    it "should sort comments chronologically" do
      comment2 = FactoryBot.create(:comment, content: "Second test comment.")
      comment1 = FactoryBot.create(:comment, user: comment2.user, image: comment2.image)
      expect(Comment.chronological).to eq ([comment2, comment1])
    end
  end
end

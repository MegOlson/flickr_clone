require "rails_helper"

describe "the favorites management path" do
  before do
    @image = FactoryBot.create(:image)
    @user = @image.user
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "allows a user to favorite an image" do
    visit image_path(@image)
    click_on "Favorite"
    expect(page).to have_content("Image Favorited!")
  end

  it "allows a user to unfavorite an favorited image" do
    visit image_path(@image)
    click_on "Favorite"
    click_on "Unfavorite"
    expect(page).to have_content("Image Unfavorited")
  end

  it "displays a user's favorites on their profile" do
    visit image_path(@image)
    click_on "Favorite"
    visit user_favorites_path(@user)
    expect(page).to have_content("Test Photo")
  end
end

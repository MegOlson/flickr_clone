require "rails_helper"

describe "the user management path" do
  before do
    @image = FactoryBot.create(:image)
    @user = @image.user
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "displays all images created by a user on their profile" do
    visit root_path
    click_on @user.name
    click_on "Images"
    expect(page).to have_content("Test Photo")
  end
end

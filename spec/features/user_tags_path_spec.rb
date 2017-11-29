require 'rails_helper'

describe "the user tags management path" do
  before do
    @image = FactoryBot.create(:image)
    @user = @image.user
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "allows a user to tag a user in an image" do
    visit image_path(@image)
    click_on "Tag User"
    expect(page).to have_content("#{@user.name} | Untag")
  end

  it "allows a user to untag a user from an image" do
    visit image_path(@image)
    click_on "Tag User"
    click_on "Untag"
    expect(page).to have_no_content("#{@user.name} | Untag")
  end

  it "displays all user's tagged photos" do
    visit image_path(@image)
    click_on "Tag User"
    visit user_path(@user)
    click_on "Tagged Photos"
    expect(page).to have_content("Test Photo")
  end
end

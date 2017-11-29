require 'rails_helper'

describe "the category management path" do
  before do
    @image = FactoryBot.create(:image)
    @user = @image.user
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "allows a user to add a new category" do
    visit image_path(@image)
    fill_in "name", with: "Tag"
    click_button "Create Category"
    expect(page).to have_content("Tag")
  end

  it "allows a user to add an existing category" do
    category = FactoryBot.create(:category)
    visit image_path(@image)
    click_on "Add Category"
    expect(page).to have_content(category.name)
  end

  it "allows a user to delete a category from an image" do
    visit image_path(@image)
    fill_in "name", with: "Tag"
    click_button "Create Category"
    click_on "Remove"
    expect(page).to have_no_content("Tag | Remove")
  end
end

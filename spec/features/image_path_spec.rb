require "rails_helper"

describe "the image management path" do
  before do
    @image = FactoryBot.create(:image)
    @user = @image.user
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "allows user to add a new image" do
    visit images_path
    click_on "Upload Image"
    fill_in "Title", with: "New Photo"
    fill_in "Caption", with: "This is a test photo"
    page.attach_file("Photo", 'spec/support/fixtures/image.jpeg')
    click_button "Create Image"
    expect(page).to have_content("New Photo")
  end

  it "reports an error if image cannot be saved" do
    visit new_image_path
    click_button "Create Image"
    expect(page).to have_content("Something went wrong")
  end

  it "allows a user to edit an image" do
    visit image_path(@image)
    click_on "Edit"
    fill_in "Title", with: "New New Photo"
    click_on "Update Image"
    expect(page).to have_content("New New Photo")
  end

  it "allows a user to delete an image" do
    visit image_path(@image)
    click_on "Delete"
    expect(page).to have_content("Image deleted")
    expect(page).to have_no_content("New Photo")
  end
end

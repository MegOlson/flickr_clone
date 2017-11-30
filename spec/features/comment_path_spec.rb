require "rails_helper"

describe "the comment management path" do
  before do
    @comment = FactoryBot.create(:comment)
    @image = @comment.image
    @user = @comment.user
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "allows a user to comment on an image" do
    visit image_path(@image)
    fill_in "comment_content", with: "Test comment."
    click_button "Create Comment"
    expect(page).to have_content("Test comment.")
  end

  it "allows a user to edit a comment" do
    visit image_path(@image)
    click_on "Edit"
    fill_in "comment_content", with: "New comment content."
    click_button "Update Comment"
    expect(page).to have_content "New comment content."
  end

  it "allows a user to delete a comment" do
    visit image_path(@image)
    click_on "Delete"
    expect(page).to have_no_content(@comment.content)
  end
end

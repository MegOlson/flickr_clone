FactoryBot.define do
  factory(:user) do
    name("test123")
    email("test123@test.com")
    password("test123")
    password_confirmation("test123")
  end

  factory(:image) do
    user
    title("Test Photo")
    photo { File.new("#{Rails.root}/spec/support/fixtures/image.jpeg")}
  end

  factory(:category) do
    name("Test Tag")
  end

  factory(:comment) do
    association :user, factory: :user, name: "Test", email: "test@test.com"
    image
    content("Test comment.")
  end
end

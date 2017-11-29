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
end

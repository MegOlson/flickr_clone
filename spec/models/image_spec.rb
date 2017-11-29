require "rails_helper"

describe Image do
  it { should belong_to :user }
  it { should have_and_belong_to_many :categories }
  it { should validate_presence_of :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :photo }
end

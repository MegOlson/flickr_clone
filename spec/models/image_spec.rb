require "rails_helper"

describe Image do
  it { should belong_to :user }
  it { should validate_presence_of :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :photo }
end

require "rails_helper"

describe UserTag do
  it { should belong_to :user }
  it { should belong_to :image }
  it { should validate_presence_of :user }
  it { should validate_presence_of :image }
end

require 'rails_helper'

describe User do
  it { should have_many :images }
  it { should have_many :favorites }
  it { should have_many :user_tags }
end

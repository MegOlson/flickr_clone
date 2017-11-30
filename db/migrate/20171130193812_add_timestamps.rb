class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column :user_tags, :created_at, :datetime
    add_column :user_tags, :updated_at, :datetime
    add_column :favorites, :created_at, :datetime
    add_column :favorites, :updated_at, :datetime

  end
end

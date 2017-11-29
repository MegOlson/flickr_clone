class Create < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tags do |t|
      t.column :user_id, :integer
      t.column :image_id, :integer
    end
  end
end

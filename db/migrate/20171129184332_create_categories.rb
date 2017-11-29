class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.column :name, :string

      t.timestamps
    end
    create_table :categories_images do |t|
      t.column :category_id, :integer
      t.column :image_id, :integer
    end
  end
end

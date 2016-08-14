class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :timestamp
    end
    add_index :categories, :title
  end
end

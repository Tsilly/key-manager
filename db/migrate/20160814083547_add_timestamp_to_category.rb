class AddTimestampToCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :timestamp
    add_column :categories, :created_at, :datetime
    add_column :categories, :updated_at, :datetime
  end
end

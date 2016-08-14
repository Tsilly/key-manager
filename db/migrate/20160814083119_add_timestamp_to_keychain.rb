class AddTimestampToKeychain < ActiveRecord::Migration
  def change
    remove_column :keychains, :timestamp
    add_column :keychains, :created_at, :datetime
    add_column :keychains, :updated_at, :datetime
  end
end

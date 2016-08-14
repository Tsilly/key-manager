class CreateKeychains < ActiveRecord::Migration
  def change
    create_table :keychains do |t|
      t.string :title
      t.string :username
      t.string :password
      t.string :url
      t.integer :category_id
      t.string :timestamp
    end
    add_index :keychains, :title
  end
end

class Category < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  
  validates_presence_of :title
  has_many :keychains, foreign_key: :category_id

  def is_empty?
    self.keychains.size == 0 ? true : false
  end
end

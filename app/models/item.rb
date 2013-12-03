class Item < ActiveRecord::Base
  has_one :category
  has_many :tags, through: :item_tags
  include ApplicationHelper
  before_create :generate_uuid

  def stock_status
    return 'Unlimited' if self.stock < 0
    return 'In stock' if self.stock > 10
    return 'Limited' if self.stock < 10
    return 'Out of stock' if self.stock == 0
  end
  
end

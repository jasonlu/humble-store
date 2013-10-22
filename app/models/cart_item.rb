class CartItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  include ApplicationHelper
  before_create :generate_uuid

  
end

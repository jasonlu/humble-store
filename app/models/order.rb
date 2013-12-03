class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipping_address
  belongs_to :cart
end

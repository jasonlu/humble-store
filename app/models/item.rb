class Item < ActiveRecord::Base
  has_one :category
  has_many :tags, through: :item_tags
  include ApplicationHelper
  before_create :generate_uuid
end

class Wishlist < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :event_id

  belongs_to :event
  belongs_to :user
end

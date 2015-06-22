class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates :city, presence: true

  has_many :wishlists
  has_many :interests

  def interests_ids
    self.interests.map(&:category_id)
  end

  def wishlist_ids
    self.wishlists.map(&:event_id)
  end
end

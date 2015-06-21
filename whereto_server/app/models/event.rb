class Event < ActiveRecord::Base
  has_many :category_events
  has_many :wishlists

  scope :featured_events, ->(interests, city, wishlist_ids) {joins(:category_events).where(category_events: {category_id: interests}).where(events: {city: city}).where.not(id: wishlist_ids)}
end

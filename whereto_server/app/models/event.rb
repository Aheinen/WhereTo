class Event < ActiveRecord::Base
  has_many :category_events
  has_many :wishlists
end

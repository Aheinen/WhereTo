class Category < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :category_events
  has_many :interests
end

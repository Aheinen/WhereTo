class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates :city, presence: true

  has_many :wishlists
  has_many :interests
end

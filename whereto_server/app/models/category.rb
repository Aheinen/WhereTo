class Category < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :category_events
  has_many :interests

  def selected(interests)
    if interests
      interests.each {|interest| return true if interest.category_id == self.id}
    end
    false
  end
end

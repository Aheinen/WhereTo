class Interest < ActiveRecord::Base
  # validates_uniqueness_of :user_id, scope: :category_id

  belongs_to :user
  belongs_to :category


end

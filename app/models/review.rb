class Review < ActiveRecord::Base
  belongs_to :for_user, class_name: 'User', foreign_key: 'for_user_id'
  belongs_to :by_user, class_name: 'User', foreign_key: 'by_user_id'
end

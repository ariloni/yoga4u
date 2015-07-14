class Review < ActiveRecord::Base
  belongs_to :for_user, class_name: 'User'
  belongs_to :by_user, class_name: 'User'
end

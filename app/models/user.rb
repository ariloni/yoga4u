class User < ActiveRecord::Base
  has_many :reviews_for_me, class_name: "Review", foreign_key: "for_user_id"
  has_many :reviews_by_me, class_name: "Review", foreign_key: "by_user_id"

  class << self
	  def from_omniauth(auth_hash)
	    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    user.first_name = auth_hash['info']['first_name']
	    user.last_name = auth_hash['info']['last_name']
	    user.image = auth_hash['info']['image']
	    user.email = auth_hash['info']['email']
	    user.url = auth_hash['info']['urls'][user.provider.capitalize]
	    user.save!
	    user
	  end
	end
end

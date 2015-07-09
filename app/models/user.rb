class User < ActiveRecord::Base
	# def self.from_omniauth(auth)
 #      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	#       user.provider = auth.provider
	#       user.uid = auth.uid
	#       user.name = auth.info.name
	#       user.oauth_token = auth.credentials.token
	#       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	#       user.save!
 #      end
	# end
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

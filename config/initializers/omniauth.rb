Rails.application.config.middleware.use OmniAuth::Builder do
		provider :developer unless Rails.env.production?
		provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"],
			scope: 'public_profile', 
			info_fields: 'id,first_name,last_name, email, picture'
			
end
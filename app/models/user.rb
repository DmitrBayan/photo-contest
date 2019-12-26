class User < ApplicationRecord
	def self.from_omniauth(auth_hash)
		user = find_or_create_by(uid: auth_hash['uid'], access_token: auth_hash['provider'])
=begin		case auth_hash['provider']
		when 'vkontakte'
			user.first_name = auth_hash['info']['first_name']
			user.last_name = auth_hash['info']['last_name']
			user.image_url = auth_hash['info']['image']
			user.url = auth_hash['info']['urls']
		when 'facebook'
			user.first_name = auth_hash['info']['name'].split(' ')[0]
			user.last_name = auth_hash['info']['name'].split(' ')[1]
			user.image_url = auth_hash['info']['image']
		else 
			return
		end
=end


		attributes = if auth_hash['provider'] == 'vkontakte'
						from_vk(auth_hash)
					elsif auth_hash['provider'] == 'facebook'
						from_facebook(auth_hash)
					else
						nil
		end

		user.assign_attributes(attributes)
		user.save!
		user
	end

	class << self
		private

		def from_facebook(auth_hash)
			user_name = auth_hash['info']['name'].split(' ')
			{
				first_name: user_name[0],
				last_name: user_name[1],
				image_url: auth_hash['info']['image']
			}
		end

		def from_vk(auth_hash)
			{
				first_name: auth_hash['info']['first_name'],
				last_name: auth_hash['info']['last_name'],
				image_url: auth_hash['info']['image'],
				url: auth_hash['info']['urls']
			}
		end
	end
end

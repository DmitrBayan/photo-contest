# frozen_string_literal: true

class User < ApplicationRecord
  def self.from_omniauth(auth_hash)

    user = find_or_create_by(uid: auth_hash['uid'],
                             access_token: auth_hash['provider'])
    case auth_hash['provider']
    when 'vkontakte'
      user.first_name = auth_hash['info']['first_name']
      user.last_name = auth_hash['info']['last_name']
      user.image_url = auth_hash['info']['image']
      user.url = auth_hash['info']['urls']
    when 'facebook'
      user.first_name = auth_hash['info']['name'].split(' ')[0]
      user.last_name = auth_hash['info']['name'].split(' ')[1]
      user.image_url = auth_hash['info']['image']
      user.url = 'https://www.facebook.com/profile.php?id=' + auth_hash['raw_info']['id']
    else
      return
    end
    user.save
    user
  end
end

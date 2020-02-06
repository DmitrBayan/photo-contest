# frozen_string_literal: true

module Users
  class Auth < ActiveInteraction::Base
    hash :auth_hash, strip: false
    def execute
      user = ::User.find_or_create_by(uid: auth_hash['uid'],
                                      provider: auth_hash['provider'],
                                      access_token: auth_hash['credentials']['token'])
      case auth_hash['provider']
      when 'vkontakte'
        user.first_name = auth_hash['info']['first_name']
        user.last_name = auth_hash['info']['last_name']
        user.image_url = auth_hash['info']['image']
        user.url = auth_hash['info']['urls']['Vkontakte']
      when 'facebook'
        user.first_name = auth_hash['info']['name'].split(' ')[0]
        user.last_name = auth_hash['info']['name'].split(' ')[1]
        user.image_url = auth_hash['info']['image']
       end
      user.save
      user
     end
  end
end
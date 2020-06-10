# frozen_string_literal: true

module Users
  class Auth < ActiveInteraction::Base
    hash :auth_hash, strip: false
    # @return user
    def execute
      user = ::User.find_or_create_by(uid: auth_hash['uid'],
                                      provider: auth_hash['provider'])
      case auth_hash['provider']
      when 'vkontakte'
        user.first_name = auth_hash['info']['first_name']
        user.last_name = auth_hash['info']['last_name']
        user.image_url = auth_hash['info']['image']
        user.url = auth_hash['info']['urls']['Vkontakte']
        user.access_token = auth_hash['credentials']['token']
      when 'facebook'
        user.first_name, user.last_name = auth_hash['info']['name'].split(' ')
        user.image_url = auth_hash['info']['image']
        user.access_token = auth_hash['credentials']['token']
      else
        user.errors.add('Unknown provider')
      end
      user.save ? user : user.errors
    end
  end
end

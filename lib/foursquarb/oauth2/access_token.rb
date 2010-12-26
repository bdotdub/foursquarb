module Foursquarb
  class OAuth2
    class AccessToken < ::OAuth2::AccessToken

      def request(verb, path, params = {}, headers = {}) 
        @client.request(verb, path, params.merge('oauth_token' => @token), headers.merge('Authorization' => "Token token=\"#{@token}\""))
      end

    end
  end
end

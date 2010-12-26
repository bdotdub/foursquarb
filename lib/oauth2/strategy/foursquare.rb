module OAuth2
  module Strategy
    class Foursquare < WebServer

      def authorize_params(options={})
        super(options).merge('response_type' => 'code')
      end

      def get_access_token(api_client, code, options = {})
        response = @client.request(:get, @client.access_token_url, access_token_params(code, options))
        access_token = response['access_token']
        Foursquarb::OAuth2::AccessToken.new(api_client, access_token)
      end

    end
  end
end

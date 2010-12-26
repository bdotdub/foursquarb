require 'oauth2/ext'
require 'oauth2/strategy/foursquare'
require 'foursquarb/oauth2/access_token'

module Foursquarb
  class OAuth2

    API_SITE_URI = "https://api.foursquare.com/"
    SITE_URI = "https://foursquare.com"

    def initialize(app_id, app_secret, opts={})
      @app_id = app_id
      @app_secret = app_secret
      @site_uri = opts[:site] || SITE_URI
      @api_site_uri = opts[:api_site] || API_SITE_URI
      @redirect_uri = opts[:redirect_uri]
    end

    def access_token(code, opts={})
      client.foursquare.get_access_token(api_client, code,
        :grant_type => 'authorization_code',
        :redirect_uri => opts[:redirect_uri] || @redirect_uri,
        :response_type => 'code')
    end

    def access_token_client(access_token)
      Foursquarb::OAuth2::AccessToken.new(api_client, access_token)
    end

    def authorize_url(client_opts={})
      opts = { :redirect_uri => @redirect_uri }.merge!(client_opts)
      client.foursquare.authorize_url(opts)
    end

  protected

    def api_client
      @api_client ||= ::OAuth2::Client.new(@app_id, @app_secret,
          :parse_json => true,
          :site => @api_site_uri)
    end

    def client
      @client ||= ::OAuth2::Client.new(@app_id, @app_secret,
          :access_token_path => '/oauth2/access_token',
          :authorize_path => '/oauth2/authenticate',
          :parse_json => true,
          :site => @site_uri)
    end

  end
end

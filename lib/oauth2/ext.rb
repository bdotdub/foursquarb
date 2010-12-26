module OAuth2

  class Client
    def foursquare; ::OAuth2::Strategy::Foursquare.new(self); end
  end

end

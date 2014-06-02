require "reddcoin/version"
require "httparty"

module Reddcoin
  
  class APIResource  
    def initialize(attrs)
      attrs.each do |name, val|
        lower_camel_cased = name.gsub(/(.)([A-Z])/,'\1_\2').downcase
        
        instance_variable_set "@#{lower_camel_cased}", val

        define_singleton_method lower_camel_cased.to_sym do
          instance_variable_get "@#{lower_camel_cased}"
        end
      end
    end
  end

  class User < APIResource; end

  class Client
    include HTTParty

    base_uri 'https://api.reddapi.com/v1/json'

    attr_accessor :get_key, :post_key

    def initialize(api_keys = {})
      @get_key = api_keys[:get]
      @post_key = api_keys[:post]
    end

    def create_new_user(username)
      response = self.class.post('/CreateNewUser', {
        :body => {
          APIKey: @post_key,
          Username: username
        }.to_json,
        :headers => {
          'Content-Type' => 'application/json'
        }
      })

      response.parsed_response
    end
    
    def send_to_address(username_from, address_to, amount)
      response = self.class.post('/SendToAddress', {
        :body => {
          APIKey: @post_key,
          UsernameFrom: username_from,
          AddressTo: address_to,
          Amount: amount
        }.to_json,
        :headers => {
          'Content-Type' => 'application/json'
        }
      })

      response.parsed_response
    end

    def move_to_user(username_from, username_to, amount)
      response = self.class.post('/MoveToUser', {
        :body => {
          APIKey: @post_key,
          UsernameFrom: username_from,
          UsernameTo: username_to,
          Amount: amount
        }.to_json,
        :headers => {
          'Content-Type' => 'application/json'
        }
      })

      response.parsed_response
    end

    def get_user_list
      response = self.class.get('/GetUserList/'+@get_key)
      
      response.parsed_response.map { |attr| User.new(attr) }
    end

    def get_user_info(username)
      response = self.class.get('/GetUserInfo/'+@get_key+'/'+username)
      
      attr = response.parsed_response

      User.new(attr)
    end

    def get_user_balance(username)
      response = self.class.get('/GetUserBalance/'+@get_key+'/'+username)
      
      response.parsed_response
    end

    def get_user_balance_detail(username)
      response = self.class.get('/GetUserBalanceDetail/'+@get_key+'/'+username)

      response.parsed_response
    end
  end
end

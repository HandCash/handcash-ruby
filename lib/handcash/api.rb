require 'handcash/api/version'
require 'net/http'
require 'json'

module Handcash
  # API is the main class for all Handcash gem functions.
  # For now this is limited to `receive`.
  class API
    attr_reader :network, :url

    TESTNET_URL = 'https://test-api.handcash.io/api/'.freeze

    def initialize(opts = {})
      # Default to testnet since mainnet is not available.
      @network = opts[:network] || :testnet
      case @network
      when :testnet
        @url = TESTNET_URL
      else
        raise "Unsupported network - #{@network}"
      end
    end

    def receive(user)
      uri = URI("#{url}receivingAddress/#{user}")
      data = Net::HTTP.get(uri)
      data == '' ? {} : JSON.parse(data)
    end
  end
end

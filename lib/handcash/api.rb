require 'handcash/api/version'
require 'net/http'
require 'json'

module Handcash
  # API is the main class for all Handcash gem functions.
  # For now this is limited to `receive`.
  class API
    attr_reader :network, :url

    TESTNET_URL = 'https://test-api.handcash.io/api/'.freeze
    MAINNET_URL = 'https://api.handcash.io/api/'.freeze

    def initialize(opts = {})
      # Default to mainnet.
      @network = opts[:network] || :mainnet
      case @network
      when :testnet
        @url = TESTNET_URL
      when :mainnet
        @url = MAINNET_URL
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

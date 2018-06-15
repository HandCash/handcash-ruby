require 'spec_helper'
require 'handcash/api'

describe Handcash::API do
  describe '#initialize' do
    it 'should support testnet' do
      hc = described_class.new(network: :testnet)
      expect(hc.url).to eq('https://test-api.handcash.io/api/')
      expect(hc.network).to eq(:testnet)
    end

    it 'should support mainnet' do
      hc = described_class.new(network: :mainnet)
      expect(hc.url).to eq('https://api.handcash.io/api/')
      expect(hc.network).to eq(:mainnet)
    end

    it 'should default to mainnet' do
      hc = described_class.new
      expect(hc.url).to eq('https://api.handcash.io/api/')
      expect(hc.network).to eq(:mainnet)
    end

    it 'should raise if an unsupported network is used' do
      expect { described_class.new(network: :crap) }
        .to raise_error('Unsupported network - crap')
    end
  end

  describe '#receive' do
    it 'should support fetching data' do
      pk = '03d193439a2f06ed1121be5b4e61381386ffee5ec5bec33daf17e33ccb34622753'
      ra = 'mxszqDyaNGFcmTkPjJ2BGRpSTChdVWaNPZ'

      VCR.use_cassette('handle') do
        expect(subject.receive('rjseibane')).to eq(
          'receivingAddress' => ra,
          'publicKey' => pk
        )
      end
    end

    it 'should handle non-existent handles' do
      VCR.use_cassette('missing_handle') do
        expect(subject.receive('hopefullydoesnotexist')).to eq({})
      end
    end
  end
end

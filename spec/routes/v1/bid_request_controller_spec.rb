ENV['RACK_ENV'] = 'test'

require './app'
require 'rspec'
require 'rack/test'
require './spec/spec_helper'

describe V1::BidRequestController do
  include Rack::Test::Methods

  def app
    V1::BidRequestController
  end

  context '.create' do
    let(:res) { post "/#{client_id}", data, 'CONTENT_TYPE' => 'application/json' }

    before do
      allow(RealtimeSender).to receive(:call)
    end

    context 'when a valid campaign exists' do
      let!(:seat) {
        create(
          :seat,
          email: 'miguel@zero-x.co'
        )
      }

      let!(:campaign) {
        create(
          :campaign,
          seat_id: seat.id,
          name: 'My Campaign'
        )
      }

      let!(:advertisement) {
        create(
          :advertisement,
          campaign_id: campaign.id,
          name: 'My Rich Media Ad'
        )
      }

      context 'when handling smaato' do
        let(:client_id) { 'smaato' }
        let(:data) { File.read('./samples/smaato/rich-media.json') }

        it 'returns 201' do
          expect(res.status).to eq(201)
        end
      end

      context 'when handling rubicon' do
        let(:client_id) { 'rubicon' }
        let(:data) { File.read('./samples/rubiconproject/example-request-app-android-1.json') }

        it 'returns 201' do
          expect(res.status).to eq(201)
        end
      end
  
      context 'when handling brandscreen' do
        let(:client_id) { 'brandscreen' }
        let(:data) { File.read('./samples/brandscreen/example-request-mobile.json') }

        it 'returns 201' do
          expect(res.status).to eq(201)
        end
      end
    end
  end
end

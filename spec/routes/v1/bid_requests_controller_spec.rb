ENV['RACK_ENV'] = 'test'

require './app'
require 'rspec'
require 'rack/test'
require './spec/spec_helper'

describe V1::BidRequestsController do
  include Rack::Test::Methods

  def app
    V1::BidRequestsController
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
          seat: seat,
          name: 'My Campaign'
        )
      }

      let!(:advertisement) {
        create(
          :advertisement,
          campaign: campaign,
          name: 'My Rich Media Ad'
        )
      }

      shared_examples 'successful bidding' do
        it 'returns 201' do
          expect(res.status).to eq(201)
        end
      end

      context 'when handling smaato' do
        let(:client_id) { 'smaato' }
        let(:data) { File.read('./samples/smaato/rich-media.json') }

        it_behaves_like 'successful bidding'
      end

      context 'when handling rubicon' do
        let(:client_id) { 'rubicon' }
        let(:data) { File.read('./samples/rubiconproject/example-request-app-android-1.json') }

        it_behaves_like 'successful bidding'
      end
  
      context 'when handling brandscreen' do
        let(:client_id) { 'brandscreen' }
        let(:data) { File.read('./samples/brandscreen/example-request-mobile.json') }

        it_behaves_like 'successful bidding'
      end
    end
  end
end

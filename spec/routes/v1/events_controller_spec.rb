ENV['RACK_ENV'] = 'test'

require './app'
require 'rspec'
require 'rack/test'
require './spec/spec_helper'

describe V1::BidRequestController do
  include Rack::Test::Methods

  def app
    V1::EventsController
  end

  context '.create' do
    let(:res) { get '/', params, 'CONTENT_TYPE' => 'application/json' }

    before do
      allow(RealtimeSender).to receive(:call)
    end

    context 'when a valid bid exists' do
      let(:seat) {
        create(
          :seat,
          email: 'miguel@zero-x.co'
        )
      }

      let(:campaign) {
        create(
          :campaign,
          seat_id: seat.id,
          name: 'My Campaign'
        )
      }

      let(:advertisement) {
        create(
          :advertisement,
          campaign_id: campaign.id,
          name: 'My Rich Media Ad'
        )
      }

      let(:exchange) {
        Exchange.first
      }

      let(:publisher) {
        create(
          :publisher,
          exchange: exchange
        )
      }

      let(:device) {
        create(
          :device,
          external_id: SecureRandom.hex
        )
      }

      let(:bid_app) {
        create(
          :app,
          publisher: publisher
        )
      }

      let(:user) {
        create(
          :user,
          exchange: exchange,
          external_id: SecureRandom.hex
        )
      }

      let(:bid) {
        create(
          :event,
          bid_request_id: SecureRandom.hex,
          type: 'bid',
          cost: (1.50 * 1_000_000).to_i,
          timestamp: DateTime.now.utc,
          exchange: exchange,
          publisher: publisher,
          app: bid_app,
          device: device,
          user: user,
          country: 'USA',
          region: 'California',
          city: 'Los Angeles'
        )
      }

      context 'when tracking a win' do
        let(:params) {
          {
            'advertisement_id' => advertisement.id,
            'bid_id' => bid.id,
            'type' => 'win'
          }
        }

        it 'returns 201' do
          expect(res.status).to eq(201)
        end
      end
    end
  end
end

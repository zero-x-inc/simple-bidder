ENV['RACK_ENV'] = 'test'

require './app'
require 'rspec'
require 'rack/test'
require './spec/spec_helper'
require './spec/shared/shared_scope'

describe V1::WinsController do
  include Rack::Test::Methods

  def app
    V1::WinsController
  end

  context '.create' do
    let(:res) { get '/', params, 'CONTENT_TYPE' => 'application/json' }

    before do
      allow(RealtimeSender).to receive(:call)
    end

    context 'when a valid scope exists' do
      include_context 'shared scope'

      context 'when tracking a win' do
        let(:params) {
          {
            'advertisement_id' => advertisement.id,
            'bid_id' => bid.id,
            'price' => (1.50 * 1_000_000).to_i
          }
        }

        it 'returns 201' do
          expect(res.status).to eq(201)
        end
      end
    end
  end
end

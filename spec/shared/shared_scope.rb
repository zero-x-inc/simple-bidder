RSpec.shared_context 'shared scope' do
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
        external_id: SecureRandom.hex,
        make: 'Apple',
        model: 'Apple',
        os: 'iOS',
        osv: '7.1',
        js: 1
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
        external_id: SecureRandom.hex,
        gender: 'm',
        yob: '1986'
      )
    }

    let(:bid) {
      create(
        :event,
        bid_request_id: SecureRandom.hex,
        type: 'bid',
        cost: (1.50 * 1_000_000).to_i,
        timestamp: DateTime.now.utc - 1.minute,
        exchange: exchange,
        publisher: publisher,
        app: bid_app,
        device: device,
        user: user,
        country: 'USA',
        region: 'California',
        city: 'Los Angeles',
        dimension: '320x480',
        make: 'Apple',
        model: 'Apple',
        os: 'iOS',
        osv: '7.1',
        js: 1,
        gender: 'm',
        yob: '1986'
      )
    }
end

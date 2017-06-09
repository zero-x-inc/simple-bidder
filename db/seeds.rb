Exchange.create!(canonical_id: 'smaato', name: 'Smaato')
Exchange.create!(canonical_id: 'rubicon', name: 'Rubicon Project')
Exchange.create!(canonical_id: 'brandscreen', name: 'Brandscreen')

seat = Seat.create!(email: 'miguel@zero-x.co')
campaign = Campaign.create(name: 'My Campaign', seat: seat)

advertisement = Advertisement.create(
  name: 'My Ad',
  campaign: campaign,
  dimension: '320x480',
  content: %Q{
    <img src="${IMPRESSION_URL}" height="0" width="0" />
    <h1>Hello World</h1>
  },
  preview_url: 'http://via.placeholder.com/320x480'
)

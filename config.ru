#\ -s puma
require './app.rb'

use Rack::Cors do
  debug true

  allow do
    origins '*'
    resource '/*', headers: :any, methods: :any
  end
end

run AnalyticsProxyApp.new
map('/v1/bid_request') { run V1::BidRequestController }
map('/') { run SimpleBidderApp }

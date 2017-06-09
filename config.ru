#\ -s puma
require './app.rb'

run SimpleBidderApp.new
map('/v1/bid_requests') { run V1::BidRequestsController }
map('/v1/wins') { run V1::WinsController }
map('/v1/events') { run V1::EventsController }
map('/') { run SimpleBidderApp }

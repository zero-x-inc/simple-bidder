class RealtimeSender
  class << self
    def call(data:)
      conn = Faraday.new(url: Config.tranquility.uri) do |faraday|
        faraday.use FaradayMiddleware::FollowRedirects, limit: 5
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end

      resp = conn.post do |req|
        req.url Config.tranquility.uri
        req.headers['Content-Type'] = 'application/json'
        req.body = data
      end

      puts "request body: #{data}"
      puts "response: #{resp.body}"
      return resp
    end
  end
end

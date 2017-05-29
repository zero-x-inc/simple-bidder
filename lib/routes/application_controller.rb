class SimpleBidderApp < Sinatra::Base
  configure do
    use Clogger, logger: $stdout, reentrant: true, format: :NginxCombined
  end

  get '/status' do
    "ok\n"
  end

  register Sinatra::Contrib
  register Sinatra::ActiveRecordExtension
end

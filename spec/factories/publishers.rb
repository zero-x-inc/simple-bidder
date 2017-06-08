FactoryGirl.define do
  factory :publisher do
    external_id { SecureRandom.hex }
    exchange { Exchange.first }
    name 'yahoo.com'
  end
end

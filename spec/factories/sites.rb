FactoryGirl.define do
  factory :site do
    publisher
    domain 'yahoo.com'
    external_id { SecureRandom.hex }
  end
end

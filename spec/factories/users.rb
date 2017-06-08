FactoryGirl.define do
  factory :user do
    exchange
    external_id { SecureRandom.hex }
  end
end

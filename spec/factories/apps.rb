FactoryGirl.define do
  factory :app do
    publisher
    name 'My App'
    external_id { SecureRandom.hex }
  end
end

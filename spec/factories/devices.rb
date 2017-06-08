FactoryGirl.define do
  factory :device do
    external_id { SecureRandom.hex }
  end
end

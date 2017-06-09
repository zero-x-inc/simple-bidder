FactoryGirl.define do
  factory :event do
    seat
    campaign
    advertisement
    type 'bid'
  end
end

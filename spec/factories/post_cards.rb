# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_card do
    name "test"
    address_line1 "test"
    city "test"
    state "test"
    zip 5348
    country "NZ"
  end
end


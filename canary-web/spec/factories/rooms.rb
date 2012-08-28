# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "MyString"
    address "MyString"
    desc "MyText"
    total 1
    price 1
  end
end

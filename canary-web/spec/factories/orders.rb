# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id 1
    room_id 1
    room_num 1
    order_name "MyString"
    order_phone "MyString"
    status 1
    price 1
    checkin "2012-11-27"
    checkout "2012-11-27"
  end
end

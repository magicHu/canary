# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :banner do
    title "MyString"
    desc "MyString"
    link "MyString"
    link_text "MyString"
    is_open false
    start_date "2012-08-08"
    stop_date "2012-08-08"
  end
end

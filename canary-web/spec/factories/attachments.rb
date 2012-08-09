# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    file_name "MyString"
    content_type "MyString"
    file_size 1
    attachmentable_type "MyString"
    attachmentable_id 1
    attach "MyString"
  end
end

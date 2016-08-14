require 'factory_girl'
require 'faker'


FactoryGirl.define do
  factory :category do |c|
    c.title { Faker::Name.title }
  end
end

FactoryGirl.define do
  factory :keychain do |f|
    f.title { Faker::Name.title }
    f.username { Faker::Internet.user_name }
    f.password { Keychain.generate_key}
    f.url { Faker::Internet.url }
  end
end

categories = FactoryGirl.create_list(:category, 5)

FactoryGirl.create_list(:keychain, 5, category: categories[1])
FactoryGirl.create_list(:keychain, 5, category: categories[2])
FactoryGirl.create_list(:keychain, 5, category: categories[3])
FactoryGirl.create_list(:keychain, 5, category: categories[4])

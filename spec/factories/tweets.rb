FactoryBot.define do
  factory :tweet do
    content { Faker::Lorem.characters(number: 140) }
    association :user
  end
end

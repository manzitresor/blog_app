# spec/factories/comment.rb

FactoryBot.define do
  factory :comment do
    trait :post do
      association :post, factory: :post
    end

    trait :user do
      association :user, factory: :user
    end
  end
end

FactoryBot.define do
  factory :post do
    author { association(:user) }
    title { 'Hello' }
    text { 'This is my first post' }
    comments_counter { 2 }
    likes_counter { 1 }
  end
end

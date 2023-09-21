FactoryBot.define do
    factory :post do
        author { association(:user) }
        title { 'Hello' } 
        text { 'This is my first post' } 
        commentsCounter { 2 } 
        linkesCounter { 1 } 
    end
  end
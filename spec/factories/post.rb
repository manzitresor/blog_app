FactoryBot.define do
    factory :poster do
        author { user } 
        title { 'Hello' } 
        text { 'This is my first post' } 
        commentsCounter { 2 } 
        linkesCounter { 1 }
    end
  end
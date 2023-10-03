FactoryBot.define do
  factory :user do
    name { 'Manzi Tresor' }
    photo { 'https://example.com/default.jpg' }
    bio { 'This is a sample bio.' }
    post_counter { 0 }
  end
end

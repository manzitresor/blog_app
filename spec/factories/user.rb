FactoryBot.define do
  factory :user do
    name { 'Manzi Tresor' }
    photo { 'https://example.com/default.jpg' }
    bio { 'This is a sample bio.' }
    postsCounter { 0 }
  end
end

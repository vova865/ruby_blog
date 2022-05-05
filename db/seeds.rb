20.times do
  title = Faker::Hipster.word
  body = Faker::Hipster.paragraph_by_chars(characters: 500, supplemental: false)
  user_id = 5
  category_id = 1
  Article.create title: title, body: body, user_id: user_id, category_id: category_id
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end


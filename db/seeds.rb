5.times do
  commenter = Faker::Name.unique.name
  body = Faker::Hipster.sentence(word_count: 3, supplemental: false, random_words_to_add: 4)
  article_id = 5
  Comment.create commenter: commenter, body: body, article_id: article_id
end

# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: '123456789', password_confirmation: '123456789')
# end

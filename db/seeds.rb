5.times do
  title = Faker::Name.unique.name
  body = Faker::Hipster.paragraph_by_chars(characters: 300, supplemental: false)
  user_id = 3
  Article.create title: title, body: body, user_id:user_id
end
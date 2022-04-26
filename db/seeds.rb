30.times do
  title = Faker::Name.unique.name
  body = Faker::Hipster.paragraph_by_chars(characters: 300, supplemental: false)
  Article.create title: title, body: body
end
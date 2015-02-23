# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: "test@test.com", username: "TestUser", password: "password")

20.times do
  User.create!(email: Faker::Internet.email,
               username: Faker::Internet.user_name,
               password: "password")
end

categories = Faker::Lorem.words(50)

User.all.each do |user|
  rand(10..30).times do
    user.articles.create(title: Faker::Lorem.words(4).join(" "),
                         description: Faker::Lorem.sentences(10).join(" "),
                         category: Category.find_or_create_by(name: categories.sample),
                         price: [rand(1.0..999.99), nil, nil, nil].sample)
  end
end

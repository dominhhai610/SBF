# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  content = "aaaaaaaaaa"
  users.each { |user| user.micropots.create!(content: content) }
end


20.times do |n|
  User.create!(name: FFaker::Name.name,
                 )
end
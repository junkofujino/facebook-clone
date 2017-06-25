# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 100.times do |n|
  email = Faker::Internet.email
  name = Faker::Internet.user_name
  password = "password"
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: n,
               )
end

@users = User.all

@users.each do |user|
  str1 = user.id.to_s
  content = str1+str1+str1+str1+str1
  created_at = Faker::Time.between(DateTime.now - 3.days, DateTime.now - 2.days)
  updated_at = created_at + 1.day
  user_id = user.id
  Topic.create!(content: content,
               created_at: created_at,
               updated_at: updated_at,
               user_id: user_id,
               )
end

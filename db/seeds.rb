# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

# Create Users
5.times do
  User.create!(
  email:    Faker::Internet.email,
  password: 'password'
  )
end

# Create admin user
1.times do
  User.create!(
  email:                  'admin@example.com',
  password:               'password',
  password_confirmation:  'password',
  role:                   'admin'
  )
end

# Create a premium user
1.times do
  User.create!(
  email:                  'premium@example.com',
  password:               'password',
  password_confirmation:  'password',
  role:                   'premium'
  )
end

# Create standard user
1.times do
  User.create!(
  email:                  'standard@example.com',
  password:               'password',
  password_confirmation:  'password',
  role:                   'standard'
  )
end
users = User.all

# Create Wikis
50.times do
  Wiki.create!(
    user:   users.sample,
    title:  Faker::Name.title,
    body:   RandomData.random_paragraph,
  )
end

wikis = Wikis.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"

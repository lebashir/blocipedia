# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

# Create user


  u =   User.new(
      email: "jose@bloc.io",
      password: "password",
      role: :member
    )
  u.skip_confirmation!
  u.save!

  tester = User.first
 # Create Wikis
 50.times do
   Wiki.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph

   )
 end
 wikis = Wiki.all

 5.times do
   Wiki.create!(
   title:  RandomData.random_sentence,
   body:   RandomData.random_paragraph,
   private: true,
   user:  tester
   )
 end




 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"

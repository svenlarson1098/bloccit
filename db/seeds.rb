# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData
#require 'random_data'

#Create Users
5.times do 
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
    )
end
users = User.all



10.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
    )
end
topics = Topic.all

#create posts
50.times do
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,     
    title: RandomData.random_sentence, 
    body: RandomData.random_paragraph
  )
  
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
      
end
posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
    )
end

#create questions
10.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
    )
  end
  
  #create advertisements
10.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: rand(1...99)
    )
  end
  
  #create sponsored posts
  20.times do
    SponsoredPost.create!(
      topic: topics.sample,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: rand(1..100)
    )
  end
=begin  
  user = User.first
    user.update_attributes!(
      name: 'Svucker',
      email: 'svucker@gmail.com', 
      password: 'helloworld'
      )
=end 
#create an admin user
  admin = User.create!(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )
#create a member
  member = User.create!(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld'
    )
    
#create a moderator
  moderator = User.create!(
    name:     'Moderator',
    email:    'moderator@example.com',
    password: 'helloworld',
    role:      'moderator'
    )

puts "#{Post.count}"
Post.find_or_create_by(title: "Try and find me!", body: "Find my elusive unique post amongst these garbled jargon entries!")
puts "#{Post.count}"

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
puts "#{Question.count} questions created"
puts "#{Advertisement.count} advertisements created"
puts "#{SponsoredPost.count} sponsored posts created"

 require 'faker'
 
# Create users
10.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10),
  )
  user.skip_confirmation!
  user.save!
  puts "#{user.name} saved!"
end

users = User.all

# Create Topics
25.times do
  Topic.create!(
    name:           Faker::Lorem.sentence,
    description:    Faker::Lorem.sentence,
    user_id:        rand(1..5)
    )
end
topics = Topic.all

 # Create Posts
 200.times do
   post = Post.create!(
     title:   Faker::Lorem.sentence,
     body:    Faker::Lorem.paragraph,
     user_id: rand(1..10),
     topic:   topics.sample
   )
   post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
   post.update_rank
 end
 posts = Post.all

 
 # Create Votes
500.times do
   Vote.create!(
     value: 1,
     user_id: rand(1..10),
     post_id: rand(1..200),
   )
 end

 
 # Create Comments
500.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph,
     user_id: rand(1..10)
   )
 end

 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com', 
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save!


 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "You can sign in by using #{User.first.email}"


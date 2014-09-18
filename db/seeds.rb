require 'faker'

20.times do
  name= Faker::Name.name
  User.create!(user_name: name, email: Faker::Internet.safe_email(name), password: Faker::Internet.password(6,12)  )
end

10.times do
  Post.create!(content: Faker::Lorem.paragraph(3), user_id: rand(User.count)+1 )
end

30.times do
  Comment.create!(content: Faker::Lorem.paragraph(3), user_id: rand(User.count)+1, post_id: rand(Post.count)+1 )
end

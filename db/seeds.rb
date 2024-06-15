User.delete_all
Post.delete_all
Review.delete_all

users = (1..100).map { |i| User.create!(username: "User#{i}") }

posts = []
users.each do |user|
  posts += (1..500).map { |i| Post.create!(title: "Title #{i}", body: "Body #{i}", user: user) }
end

posts.each do |post|
  (1..10).each do
    Review.create!(rating: rand(1..5), comment: "Comment", post: post, user: users.sample)
  end
end

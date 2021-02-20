# メインのサンプルユーザーを1人作成する
User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

# ユーザー6人のマイクロポストを生成する。
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 4, random_words_to_add: 3)
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップを生成する
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# ワールド生成
10.times do |n|
  name = "test_world_#{n + 1}"
  seed = rand(-2**47...2**47 - 1)
  world = World.create!(name: name, seed: seed)
  world.users << User.all.sample(n)
end

# ワールドにスポットを持たせる
100.times do |n|
  place = Faker::Lorem.sentence(word_count: 2)
  dimension = %w[overworld nether]
  memo = Faker::Lorem.sentence(word_count: 3)
  x = rand(-999...999)
  y = rand(-999...999)
  z = rand(-999...999)

  world = World.all.sample
  world.spots.create!(place: place,
                      dimension: dimension[n % 2],
                      memo: memo,
                      point_x: x,
                      point_y: y,
                      point_z: z)
end

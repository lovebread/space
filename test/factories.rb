Factory.define :user do |u|
  u.gender 'male'
  u.password '111111'
end

Factory.define :friendship do |u|
  u.status 1
end

Factory.define :game do |g|
end

Factory.define :game_area do |g|
end

Factory.define :game_server do |g|
end

Factory.define :blog do |b|
  b.title 'blog title'
  b.content 'blog content'
  b.privilege 1
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  c = Category.new
  c.name = Faker::Name.name
  c.description = Faker::Company.industry
  c.save
end

Category.all.each do |cate|
  5.times do |t|
  	p = cate.products.new
	p.category_id = cate.id
	p.name = Faker::Name.name
	p.description = Faker::Company.industry
	p.stock = Faker::Number.within(range: 10..100)
	p.price = Faker::Number.within(range: 1000..10000)
	p.save
  end
end
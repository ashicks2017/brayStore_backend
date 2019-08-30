# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Category.create(title: "T-shirt")


item1= Item.create(title:"Runway Tee", price:12, description:"Pilot Airplane Shirt US Men's trend 2019", category_id:cat1.id, img_url:"https://i.ebayimg.com/thumbs/images/m/mQgwrm0vZwfJe94QPDPSffQ/s-l225.webp")


require 'faker'
include Faker
10.times do
    Customer.create(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address, password_digest: "password")

end

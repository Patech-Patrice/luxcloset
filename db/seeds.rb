# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(username:"Mae", email:"mae@gmail.com", password: "mae")

Designer.create!(name:"Christian Louboutin", country:"Paris")

Shoe.create!(brand:"Christian Louboutin", color:"Pink", fabric: "Leather")

Handbag.create!(brand:"Louis Vuitton", color:"Azur", fabric: "Leather")
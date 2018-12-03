# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Organization.destroy_all
User.destroy_all
Commitment.destroy_all

Organization.create(name: "Clickngoat")
User.create(first_name: "Fred", last_name: "Delacompta", email: "fred@clickngoat.com", organization_id: 1, password: "123456")

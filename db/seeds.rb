# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Commitment.destroy_all
# Supplier.destroy_all
# Organization.destroy_all
# User.destroy_all

# puts "Destroyed Everything"

jarvis = Organization.create!(name: "Jarvis")

photo_a = "https://kitt.lewagon.com/placeholder/users/random"
photo_b = "https://kitt.lewagon.com/placeholder/users/random"
photo_c = "https://kitt.lewagon.com/placeholder/users/random"
photo_d = "https://kitt.lewagon.com/placeholder/users/random"

a = User.create(first_name: "Fred", last_name: "Delacompta", email: "fred@michel.com", organization: Organization.last, password: "123456", photo: photo_a)
b = User.create(first_name: "Kevin", last_name: "Mbappe", email: "kevin@michel.com", organization: Organization.last, password: "123456", photo: photo_b)
c = User.create(first_name: "Carine", last_name: "Desachats", email: "carine@michel.com", organization: Organization.last, password: "123456", photo: photo_c)
d = User.create(first_name: "Yoon", last_name: "Kim", email: "yoon@michel.com", organization: Organization.last, password: "123456", photo: photo_d)

leboncoin = Supplier.create!(name: "Leboncoin", organization: Organization.last)
leboncoin1 = Commitment.create!(title: "achat d'un meuble", amount: 1400, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: Supplier.last, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)

amazon = Supplier.create!(name: "Amazon", organization: Organization.last)
amazon2 = Commitment.create!(title: "achat d'ordinateurs", amount: 10000, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 1, supplier: Supplier.last, user: User.second, recurrence: 0, payment_method: 1, retrieval_mode: 0)

apple = Supplier.create!(name: "Apple", organization: Organization.last)
appleios = Commitment.create!(title: "ios dev apple", amount: 4000, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 1, supplier: Supplier.last, user: User.third, recurrence: 0, payment_method: 0, retrieval_mode: 1)

facebook = Supplier.create!(name: "Facebook", organization: Organization.last)
facebookads = Commitment.create!(title: "facebookads", amount: 5000, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 1, supplier: Supplier.last, user: User.first, recurrence: 0, payment_method: 1, retrieval_mode: 0)

google = Supplier.create!(name: "Google", organization: Organization.last)
googleads = Commitment.create!(title: "googleads", amount: 10000, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: Supplier.last, user: User.second, recurrence: 0, payment_method: 0, retrieval_mode: 1)

orange = Supplier.create!(name: "Orange", organization: Organization.last)
orangenovembre = Commitment.create!(title: "orangenovembre", amount: 50, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 0, supplier: Supplier.last, user: User.third, recurrence: 1, payment_method: 1, retrieval_mode: 0)

sncf = Supplier.create!(name: "SNCF", organization: Organization.last)
sncfbillet = Commitment.create!(title: "billet Paris Marseille", amount: 200, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: Supplier.last, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)

puts "Created 1 Organization, 3 Users, 7 Suppliers & Commitments"

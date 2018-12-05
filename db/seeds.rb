# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Commitment.destroy_all
Supplier.destroy_all
Organization.destroy_all
User.destroy_all

puts "Destroyed Everything"

jarvis = Organization.create(name: "Jarvis")

photo_a = "https://i.f1g.fr/media/figaro/805x453_crop/2017/10/25/XVMec083c12-b965-11e7-8bd2-4d87b82d3252.jpg"
photo_b = "https://i.eurosport.com/2018/05/07/2329586-48490499-640-360.jpg"
photo_c = "https://content.mosaiquefm.net/uploads/content/thumbnails/ronaldinho_1527164870.jpg"

a = User.create(first_name: "test", last_name: "test", email: "test@test.com", organization: Organization.last, password: "123456", photo: photo_a)
b = User.create(first_name: "test2", last_name: "test2", email: "test2@test2.com", organization: Organization.last, password: "123456", photo: photo_b)
c = User.create(first_name: "test3", last_name: "test3", email: "test3@test3.com", organization: Organization.last, password: "123456", photo: photo_c)

leboncoin = Supplier.create!(name: "Leboncoin", organization: Organization.first)
leboncoin1 = Commitment.create!(title: "achat d'un meuble", amount: 1400, due_date: "01/12/2018".to_date, payment_date: "15/01/2019".to_date, status: 0, supplier: Supplier.last, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)

amazon = Supplier.create!(name: "Amazon", organization: Organization.first)
amazon2 = Commitment.create!(title: "achat d'ordinateurs", amount: 10000, due_date: "27/06/2018".to_date, payment_date: "15/10/2018".to_date, status: 0, supplier: Supplier.last, user: User.second, recurrence: 0, payment_method: 1, retrieval_mode: 0)

apple = Supplier.create!(name: "apple", organization: Organization.first)
appleios = Commitment.create!(title: "ios dev apple", amount: 4000, due_date: "01/01/2018".to_date, payment_date: "31/03/2018".to_date, status: 0, supplier: Supplier.last, user: User.third, recurrence: 0, payment_method: 0, retrieval_mode: 1)

facebook = Supplier.create!(name: "facebook", organization: Organization.first)
facebookads = Commitment.create!(title: "facebookads", amount: 5000, due_date: "27/08/2018".to_date, payment_date: "15/09/2018".to_date, status: 0, supplier: Supplier.last, user: User.first, recurrence: 0, payment_method: 1, retrieval_mode: 0)

google = Supplier.create!(name: "google", organization: Organization.first)
googleads = Commitment.create!(title: "googleads", amount: 10000, due_date: "01/12/2018".to_date, payment_date: "26/12/2018".to_date, status: 0, supplier: Supplier.last, user: User.second, recurrence: 0, payment_method: 0, retrieval_mode: 1)

orange = Supplier.create!(name: "orange", organization: Organization.first)
orangenovembre = Commitment.create!(title: "orangenovembre", amount: 50, due_date: "27/11/2018".to_date, payment_date: "15/12/2018".to_date, status: 0, supplier: Supplier.last, user: User.third, recurrence: 1, payment_method: 1, retrieval_mode: 0)

sncf = Supplier.create!(name: "sncf", organization: Organization.first)
sncfbillet = Commitment.create!(title: "billet Paris Marseille", amount: 200, due_date: "01/04/2018".to_date, payment_date: "31/05/2018".to_date, status: 0, supplier: Supplier.last, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)

puts "Created 1 Organization, 1 User, 7 Supplier & Commitment"

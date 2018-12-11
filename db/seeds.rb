Commitment.destroy_all
puts "Commitment destroyed"
Supplier.destroy_all
puts "Supplier destroyed"
User.destroy_all
puts "User destroyed"
Organization.destroy_all
puts "Organization destroyed"

jarvis = Organization.create!(name: "Jarvis")
puts "Organization Created"

photo_a = "https://kitt.lewagon.com/placeholder/users/random"
photo_b = "https://kitt.lewagon.com/placeholder/users/random"
photo_c = "https://kitt.lewagon.com/placeholder/users/random"
photo_d = "https://kitt.lewagon.com/placeholder/users/random"

a = User.create(first_name: "Fred", last_name: "Delacompta", email: "fred@michel.com", organization: Organization.last, password: "123456", photo: photo_a)
b = User.create(first_name: "Kevin", last_name: "Mbappe", email: "kevin@michel.com", organization: Organization.last, password: "123456", photo: photo_b)
c = User.create(first_name: "Carine", last_name: "Desachats", email: "carine@michel.com", organization: Organization.last, password: "123456", photo: photo_c)
d = User.create(first_name: "Yoon", last_name: "Kim", email: "yoon@michel.com", organization: Organization.last, password: "123456", photo: photo_d)
puts "User created"


leboncoin1 = Commitment.create!(title: "achat d'un meuble", amount: 1400, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: leboncoin, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)
amazon2 = Commitment.create!(title: "achat d'ordinateurs", amount: 10000, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 1, supplier: amazon, user: User.second, recurrence: 0, payment_method: 1, retrieval_mode: 0)
appleios = Commitment.create!(title: "ios dev apple", amount: 4000, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 1, supplier: apple, user: User.third, recurrence: 0, payment_method: 0, retrieval_mode: 1)
facebookads = Commitment.create!(title: "facebookads", amount: 5000, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 1, supplier: facebook, user: User.first, recurrence: 0, payment_method: 1, retrieval_mode: 0)
googleads = Commitment.create!(title: "googleads", amount: 10000, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: google, user: User.second, recurrence: 0, payment_method: 0, retrieval_mode: 1)
orangenovembre = Commitment.create!(title: "orangenovembre", amount: 50, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 0, supplier: orange, user: User.third, recurrence: 1, payment_method: 1, retrieval_mode: 0)
sncfbillet = Commitment.create!(title: "billet Paris Marseille", amount: 200, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: sncf, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)
puts "Commitments created"

leboncoin = Supplier.create!(name: "Leboncoin", organization: Organization.last)
amazon = Supplier.create!(name: "Amazon", organization: Organization.last)
apple = Supplier.create!(name: "Apple", organization: Organization.last)
facebook = Supplier.create!(name: "Facebook", organization: Organization.last)
google = Supplier.create!(name: "Google", organization: Organization.last)
orange = Supplier.create!(name: "Orange", organization: Organization.last)
sncf = Supplier.create!(name: "SNCF", organization: Organization.last)
puts "Suppliers created"




puts "Created 1 Organization, 3 Users, 7 Suppliers & Commitments"

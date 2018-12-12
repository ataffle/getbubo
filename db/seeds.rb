# Commitment.destroy_all
# puts "Commitment destroyed"
# Supplier.destroy_all
# puts "Supplier destroyed"
# User.destroy_all
# puts "User destroyed"
# Organization.destroy_all
# puts "Organization destroyed"

letrain = Organization.create!(name: "Le train")
puts "Organization Created"

suppliers_names = ["Leboncoin", "Seloger", "Orange", "Gates Avocats", "Direct Energie", "Lucca", "Dropbox", "Google", "Facebook", "Front", "Aircall", "Lunchr", "Pipedrive", "Basecamp", "Eufonie", "Octopush", "OVH", "Matterport", "Sendgrid", "SensioLabs", "Github", "CI Circle", "Bouygues Telecom", "Gandi" ]
statuses = [0,1,2]
recurrences = [0,1]
commitment_titles = []
amounts = (50..2000)
retrieval_modes = [0,1,2]
payment_methods = [0,1,2]


puts "Creating suppliers..."
suppliers_names.each do |supplier_name|
  Supplier.create!(name: supplier_name, organization: Organization.last)
end
suppliers = Supplier.all
puts " #{suppliers.length} suppliers created"


puts "Creating users..."
user1 = User.create(first_name: "Clémentine", last_name: "Delacompta", email: "clementine@letrain.com", organization: Organization.last, password: "127456", photo: "user1.jpg")
user2 = User.create(first_name: "Marion", last_name: "Mbappe", email: "marion@letrain.com", organization: Organization.last, password: "123456", photo: "user2.jpg")
user3 = User.create(first_name: "Adrien", last_name: "Torsen", email: "adrien@letrain.com", organization: Organization.last, password: "123456", photo: "user3.jpg")
user4 = User.create(first_name: "Carine", last_name: "Desachats", email: "carine@letrain.com", organization: Organization.last, password: "123456", photo: "user4.jpg")
user5 = User.create(first_name: "Gus", last_name: "Duwagon", email: "gus@letrain.com", organization: Organization.last, password: "123456", photo: "user5.jpg")
user6 = User.create(first_name: "Guy", last_name: "Deschamps", email: "guy@letrain.com", organization: Organization.last, password: "123456", photo: "user6.jpg")
user7 = User.create(first_name: "Boris", last_name: "du Design", email: "boris@letrain.com", organization: Organization.last, password: "123456", photo: "user7.png")
user8 = User.create(first_name: "Edward", last_name: "Gourou", email: "edward@letrain.com", organization: Organization.last, password: "123456", photo: "user8.jpg")
user9 = User.create(first_name: "Seb", last_name: "Delanavbar", email: "seb@letrain.com", organization: Organization.last, password: "123456", photo: "user9.jpg")
user10 = User.create(first_name: "Alix", last_name: "Thezbar", email: "alix@letrain.com", organization: Organization.last, password: "123456", photo: "user10.jpg")
users = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
puts "#{users.length} users created"


puts "Creating November commitments"
10.times do
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "achat"
  amount = rand(50..2000)
  status = rand(0..2)
  retrieval_mode = retrieval_modes.sample
  user = users.sample
  recurrence = recurrences.sample
  payment_method = payment_methods.sample
  Commitment.create!(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice: "invoice")
end
puts "Created 10 commitments"
#Cloudinary::Uploader.upload("invoice.pdf")
puts "Creating December commitments"
10.times do
    due_date = "15/12/2018"
    supplier = suppliers.sample
    title = "achat"
    amount = rand(50..2000)
    status = rand(0..1)
    retrieval_mode = retrieval_modes.sample
    user = users.sample
    recurrence = 0
    payment_method = payment_methods.sample
    Commitment.create!(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice: "invoice")
end
puts "Created 10 commitments"
# leboncoin1 = Commitment.create!(title: "achat d'un meuble", amount: 1400, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: leboncoin, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)
# amazon2 = Commitment.create!(title: "achat d'ordinateurs", amount: 10000, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 1, supplier: amazon, user: User.second, recurrence: 0, payment_method: 1, retrieval_mode: 0)
# appleios = Commitment.create!(title: "ios dev apple", amount: 4000, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 1, supplier: apple, user: User.third, recurrence: 0, payment_method: 0, retrieval_mode: 1)
# facebookads = Commitment.create!(title: "facebookads", amount: 5000, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 1, supplier: facebook, user: User.first, recurrence: 0, payment_method: 1, retrieval_mode: 0)
# googleads = Commitment.create!(title: "googleads", amount: 10000, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: google, user: User.second, recurrence: 0, payment_method: 0, retrieval_mode: 1)
# orangenovembre = Commitment.create!(title: "orangenovembre", amount: 50, due_date: "27/11/2018".to_date, payment_date: "28/11/2018".to_date, status: 0, supplier: orange, user: User.third, recurrence: 1, payment_method: 1, retrieval_mode: 0)
# sncfbillet = Commitment.create!(title: "billet Paris Marseille", amount: 200, due_date: "01/11/2018".to_date, payment_date: "02/11/2018".to_date, status: 0, supplier: sncf, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)
# puts "Commitments created"

# leboncoin = Supplier.create!(name: "Leboncoin", organization: Organization.last)
# amazon = Supplier.create!(name: "Amazon", organization: Organization.last)
# apple = Supplier.create!(name: "Apple", organization: Organization.last)
# facebook = Supplier.create!(name: "Facebook", organization: Organization.last)
# google = Supplier.create!(name: "Google", organization: Organization.last)
# orange = Supplier.create!(name: "Orange", organization: Organization.last)
# sncf = Supplier.create!(name: "SNCF", organization: Organization.last)
# puts "Suppliers created"






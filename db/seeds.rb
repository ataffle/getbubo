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


puts "Creating facture en attente mensuelle"
1.times do
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "achat"
  amount = rand(50..2000)
  status = 0
  retrieval_mode = retrieval_modes.sample
  user = user10
  recurrence = 1
  payment_method = payment_methods.sample
  Commitment.create!(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice: "invoice")
end
puts "CCreating facture en attente mensuelle"

puts "Creating paiement en attente mensuelle"
1.times do
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "achat"
  amount = rand(50..2000)
  status = 1
  retrieval_mode = retrieval_modes.sample
  user = user10
  recurrence = 1
  payment_method = payment_methods.sample
  Commitment.create!(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice: "invoice")
end
puts "Creating paiement en attente mensuelle"

puts "Creating Payé mensuelle"
2.times do
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "achat"
  amount = rand(50..2000)
  status = 2
  retrieval_mode = retrieval_modes.sample
  user = user10
  recurrence = 1
  payment_method = payment_methods.sample
  Commitment.create!(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice: "invoice")
end
puts "Creating Payé mensuelle"

puts "Creating Facture en attente Ponctuelle"
2.times do
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "achat"
  amount = rand(50..2000)
  status = 0
  retrieval_mode = retrieval_modes.sample
  user = user10
  recurrence = 0
  payment_method = payment_methods.sample
  Commitment.create!(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice: "invoice")
end
puts "Created Facture en attente Ponctuelle"

puts "Creating Paiment en attente Ponctuelle"
3.times do
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "achat"
  amount = rand(50..2000)
  status = 1
  retrieval_mode = retrieval_modes.sample
  user = user10
  recurrence = 0
  payment_method = payment_methods.sample
  Commitment.create!(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice: "invoice")
end
puts "Created Paiement en attente Ponctuelle"

puts "Creating Payé Ponctuelle"
3.times do
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "achat"
  amount = rand(50..2000)
  status = 2
  retrieval_mode = retrieval_modes.sample
  user = user10
  recurrence = 0
  payment_method = payment_methods.sample
  Commitment.create!(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice: "invoice")
end
puts "Created Payé Ponctuelle"

#Cloudinary::Uploader.upload("invoice.pdf")

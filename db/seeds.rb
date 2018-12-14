Commitment.destroy_all
puts "Commitment destroyed"
Supplier.destroy_all
puts "Supplier destroyed"
User.destroy_all
puts "User destroyed"
Organization.destroy_all
puts "Organization destroyed"

letrain = Organization.create!(name: "Le Train")
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
user10 = User.create(first_name: "Alix", last_name: "Tafflé", email: "alix@letrain.com", organization: Organization.last, password: "123456", photo: "user10.jpg")
users = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
puts "#{users.length} users created"


puts "Creating Payé Mensuel"
10.times do
  commitments = Commitment.all
  commitments_count = commitments.count
  commitments_count_sec = commitments.count
  order_ref = "PO-2018-#{commitments_count + 1}"
  invoice_ref = "AC-#{commitments_count_sec + 1}"
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "Abonnement"
  amount = rand(50..2000)
  status = 2
  retrieval_mode = retrieval_modes.sample
  user = user1
  recurrence = 1
  payment_method = payment_methods.sample
  te =Commitment.new(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice_ref: invoice_ref, order_ref: order_ref, invoice: Cloudinary::Uploader.upload("invoice.pdf", options = {public_id: invoice_ref, type: 'private'}))
  te.save!
end
puts "Creating Payé Mensuel"

puts "Creating Paiment en attente Ponctuel"
1.times do
  commitments = Commitment.all
  commitments_count = commitments.count
  commitments_count_sec = commitments.count
  order_ref = "PO-2018-#{commitments_count + 1}"
  invoice_ref = "AC-#{commitments_count_sec + 1}"
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "Achat"
  amount = rand(50..2000)
  status = 1
  retrieval_mode = retrieval_modes.sample
  user = user10
  recurrence = 0
  payment_method = payment_methods.sample
  te = Commitment.new(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice_ref: invoice_ref, order_ref: order_ref, invoice: Cloudinary::Uploader.upload("invoice.pdf", options = {public_id: invoice_ref, type: 'private'}))
  te.save!
end
puts "Created Paiement en attente Ponctuel"

puts "Creating Payé Ponctuel"
20.times do
  commitments = Commitment.all
  commitments_count = commitments.count
  commitments_count_sec = commitments.count
  order_ref = "PO-2018-#{commitments_count + 1}"
  invoice_ref = "AC-#{commitments_count_sec + 1}"
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "Achat"
  amount = rand(50..2000)
  status = 2
  retrieval_mode = retrieval_modes.sample
  user = user10
  recurrence = 0
  payment_method = payment_methods.sample
  te =Commitment.new(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, invoice_ref: invoice_ref, order_ref: order_ref, invoice: Cloudinary::Uploader.upload("invoice.pdf", options = {public_id: invoice_ref, type: 'private'}))
  te.save!
end
puts "Created Payé Ponctuel"

puts "Creating Facture en attente Ponctuel"
2.times do
  commitments = Commitment.all
  commitments_count = commitments.count
  order_ref = "PO-2018-#{commitments_count + 1}"
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "Achat"
  amount = rand(50..2000)
  status = 0
  retrieval_mode = retrieval_modes.sample
  user = user9
  recurrence = 0
  payment_method = payment_methods.sample
  te =Commitment.new(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, order_ref: order_ref, invoice: "invoice")
  te.save!
end
puts "Created Facture en attente Ponctuel"

puts "Creating Facture en attente Mensuel"
2.times do
  commitments = Commitment.all
  commitments_count = commitments.count
  order_ref = "PO-2018-#{commitments_count + 1}"
  due_date = "15/11/2018"
  supplier = suppliers.sample
  title = "Abonnement"
  amount = rand(50..2000)
  status = 0
  retrieval_mode = retrieval_modes.sample
  user = user4
  recurrence = 1
  payment_method = payment_methods.sample
  te =Commitment.new(title: title, amount: amount, due_date: due_date.to_date, payment_date: due_date.to_date, status: status, supplier: supplier, user: user, recurrence: recurrence, payment_method: payment_method, retrieval_mode: retrieval_mode, order_ref: order_ref, invoice: "invoice")
  te.save!
end
puts "Created Facture en attente Mensuel"

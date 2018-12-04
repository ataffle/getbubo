# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Commitment.destroy_all
Supplier.destroy_all


leboncoin = Supplier.create(name: "Leboncoin", organization: Organization.first)
amazon = Supplier.create(name: "Amazon", organization: Organization.first)

leboncoin1 = Commitment.create!(title: "achat d'un meuble", amount: 1400, due_date: "01/12/2018", payment_date: "31/12/2018", status: 0, supplier: Supplier.first, user: User.first, recurrence: 0, payment_method: 0, retrieval_mode: 1)
amazon2 = Commitment.create!(title: "achat d'ordinateurs", amount: 10000, due_date: "27/06/2018", payment_date: "15/07/2018", status: 0, supplier: Supplier.second, user: User.first, recurrence: 1, payment_method: 1, retrieval_mode: 0)


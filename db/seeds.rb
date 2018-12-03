# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Commitment.destroy_all
Supplier.destroy_all

leboncoin = Supplier.create(name: "leboncoin", organization: Organization.first)
amazon = Supplier.create(name: "amazon", organization: Organization.first)

leboncoin1 = Commitment.create!(title: "achat d'un meuble", amount: 1400, due_date: "31/12/2018", status: "pending", supplier: Supplier.first, user: User.first, recurrence: "one-off")
amazon2 = Commitment.create!(title: "achat d'ordinateurs", amount: 10000, due_date: "27/02/2019", status: "pending", supplier: Supplier.second, user: User.first, recurrence: "one-off")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	Artist.create(name: "Dius Olexander", email:"dius@example.com", password:"password", phone:"0663477974", link:"//")
	CategoryGroup.create(name: "Фарби")
	Category.create(name:"Олійні",category_group_id: 1)
	Category.create(name:"Гуаш",category_group_id: 1)
	Category.create(name:"Без фарб",category_group_id: 1)
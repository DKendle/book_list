# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
one = User.create(name: "Dina", email: "dina@flatiron.com", password: "helloworld")
two = User.create(name: "Darren", email: "donchawish@gmail.com", password: "Things")
three = User.create(name: "Amanda", email: "amandapanda@hotmail.com", password: "Wedgewood")
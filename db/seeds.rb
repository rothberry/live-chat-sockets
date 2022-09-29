# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "DELETING..."
User.destroy_all
Message.destroy_all

puts "Users..."
u1 = User.create(name: "Phil", status: "online")
u2 = User.create(name: "Chauncy", status: "offline")

puts "Messages..."
Message.create(user: u1, content: "aaaa")
Message.create(user: u2, content: "bbbb")
Message.create(user: u1, content: "cccc")
Message.create(user: u2, content: "dddd")
Message.create(user: u1, content: "eeee")
Message.create(user: u2, content: "ffff")

puts "done"

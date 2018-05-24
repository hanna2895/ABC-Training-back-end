# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(name: "Hannah", email: "hannah@hannah.com", is_lead_admin: true)
Admin.create(name: "Not Hannah", email: "hannah@hannah.com", is_lead_admin: false)
Client.create([{name: "Client A"}, {name: "Client B"}, {name: "Client C"}])
Group.create([{name: "Group 1", client_id: 1, student_id: 1}, {name: "Group 1", client_id: 2}, {name: "Group 2", client_id: 1}])
Student.create(name: "Joe", email: "email@email.com", group_id: 1)

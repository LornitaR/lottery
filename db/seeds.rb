# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ticket_one = Ticket.create(ticket_id: 123)
ticket_two = Ticket.create(ticket_id: 234)
ticket_three = Ticket.create(ticket_id: 456)

ticket_line_1 = TicketLine.create(num_one: 0, num_two: 1, num_three: 1, score: 10)
ticket_line_2 = TicketLine.create(num_one: 1, num_two: 0, num_three: 2, score: 1)
ticket_line_3 = TicketLine.create(num_one: 2, num_two: 0, num_three: 0, score: 10)
ticket_line_4 = TicketLine.create(num_one: 1, num_two: 0, num_three: 1, score: 0)
ticket_line_5 = TicketLine.create(num_one: 0, num_two: 1, num_three: 1, score: 1)
ticket_line_6 = TicketLine.create(num_one: 1, num_two: 1, num_three: 1, score: 5)
ticket_line_7 = TicketLine.create(num_one: 0, num_two: 2, num_three: 0, score: 10)


require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')


require('pry')


Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Elliot', 'funds' => 100})
customer1.save()

customer2 = Customer.new({'name' => 'Louise', 'funds' => 200})
customer2.save()

customer3 = Customer.new({'name' => 'Harrison', 'funds' => 300})
customer3.save()

customer4 = Customer.new({'name' => 'Zsolt', 'funds' => 400})
customer4.save()

film1 = Film.new({'title' => 'Pain and Gain'})
film1.save()

film2 = Film.new({'title' => 'Wolf of Wall Street'})
film2.save()

film3 = Film.new({'title' => 'Thor: Ragnarok'})
film3.save()

film4 = Film.new({'title' => 'The Avengers: End Game'})
film4.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film3.id})
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer4.id, 'film_id' => film4.id})
ticket4.save()

binding.pry
nil

require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')


require('pry')


customer1 = Customer.new({'name' => 'Elliot', 'funds' => 100})

customer2 = Customer.new({'name' => 'Louise', 'funds' => 200})

customer3 = Customer.new({'name' => 'Harrison', 'funds' => 300})

customer4 = Customer.new({'name' => 'Zsolt', 'funds' => 400})

film1 = Film.new({'title' => 'Pain and Gain'})

film2 = Film.new({'title' => 'Wolf of Wall Street'})

film3 = Film.new({'title' => 'Thor: Ragnarok'})

film4 = Film.new({'title' => 'The Avengers: End Game'})


ticket1 = customer1.buy_ticket(film1)
ticket2 = customer2.buy_ticket(film2)
ticket3 = customer3.buy_ticket(film3)
ticket4 = customer4.buy_ticket(film4)

binding.pry
nil

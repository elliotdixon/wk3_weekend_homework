
require_relative('../db/sql_runner.rb')
require_relative('film.rb')
require_relative('customer.rb')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      film_id
    )VALUES
    (
      $1,
      $2
    ) RETURNING id"
    values = [@customer_id, @film_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def location()
  sql = "SELECT * FROM customers WHERE id = $1"
  values = [@customer_id]
  customer_hash = SqlRunner.run(sql, values).first
  return Customer.new(customer_hash)
  end

  def user()
  sql = "SELECT * FROM films WHERE id = $1"
  values = [@film_id]
  film_hash = SqlRunner.run(sql, values).first
  return Film.new(film_hash)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map { |ticekt| Ticket.new(ticket) }
  end

end

require_relative('../db/sql_runner.rb')
require_relative('ticket.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )VALUES
    (
      $1, $2
    ) RETURNING id"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update_name(new_name)
   @name = new_name
   sql = "UPDATE customers SET name = $1 WHERE id = $2"
   values = [@name, @id]
   SqlRunner.run(sql, values)
  end

  def update_funds(new_total)
  @funds = new_total
  sql = "UPDATE customers SET funds = $1 WHERE id = $2"
  values = [@funds, @id]
  SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer) }
  end

end

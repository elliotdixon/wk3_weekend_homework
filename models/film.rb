require_relative('../db/sql_runner.rb')
require_relative('customer.rb')


class Film

  attr_reader(:id)
  attr_accessor(:title)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
  end

  def save()
    sql = "INSERT INTO films
    (
      title
    )VALUES
    (
      $1
    ) RETURNING id"
    values = [@title]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update(new_title)
    @title = new_title
    sql = "UPDATE films SET title = $1 WHERE id = $2"
    values = [@title, @id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film) }
  end

end

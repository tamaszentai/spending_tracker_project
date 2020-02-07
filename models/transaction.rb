require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :amount, :merchant, :tag

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @merchant = options['merchant']
    @tag = options['tag']
  end

  def save()
    sql = "INSERT INTO transactions
    (
      amount,
      merchant,
      tag
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@amount, @merchant, @tag]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end
end

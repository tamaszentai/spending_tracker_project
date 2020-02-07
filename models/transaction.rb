require_relative('../db/sql_runner')

class Transaction
  attr_accessor :amount, :merchant, :tag
  attr_reader :id

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

  def update()
    sql = "UPDATE transactions
    SET
    (
      amount,
      merchant,
      tag
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@amount, @merchant, @tag, @id]
    SqlRunner.run(sql, values)
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

  def self.all()
    sql = "SELECT * FROM transactions"
    transaction_data = SqlRunner.run(sql)
    transactions = map_items(transaction_data)
    return transactions
  end

  def self.map_items(transaction_data)
    return transaction_data.map { |transaction| Transaction.new(transaction) }
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    transaction = Transaction.new(result)
    return transaction
  end
end

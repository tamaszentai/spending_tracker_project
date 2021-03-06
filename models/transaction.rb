require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :date_stamp, :amount, :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date_stamp = options['date_stamp']
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (
      date_stamp,
      amount,
      merchant_id,
      tag_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@date_stamp, @amount, @merchant_id, @tag_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE transactions
    SET
    (
      date_stamp,
      amount,
      merchant_id,
      tag_id
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@date_stamp, @amount, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def merchant()
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run( sql, values )
    return Merchant.new( results.first )
  end

  def tag()
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run( sql, values )
    return Tag.new( results.first )
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

  def self.sum()
    sql = "SELECT SUM (amount)
    FROM transactions"
    sum_data = SqlRunner.run(sql)
    sum = sum_data[0]
    return sum["sum"].to_i
  end

  def self.sort_by_date(array_of_transactions)
    sorted_array = array_of_transactions.sort_by {|transaction| transaction.date_stamp}
    return sorted_array.reverse
  end
end

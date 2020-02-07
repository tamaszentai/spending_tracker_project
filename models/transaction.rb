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
end

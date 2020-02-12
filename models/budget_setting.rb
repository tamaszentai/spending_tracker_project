require_relative('../db/sql_runner')

class BudgetSetting

  attr_reader :id, :budget_limit

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @budget_limit = options['name']
  end

  def save()
    sql = "INSERT INTO tags
    (
      budget_limit
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@budget_limit]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE tags
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM budgetsettings"
    budgetsetting_data = SqlRunner.run(sql)
    budgetsettings = map_items(budgetsetting_data)
    return budgetsettings
  end

  def self.map_items(budgetsetting_data)
    return budgetsetting_data.map { |budget_setting| BudgetSetting.new(budget_setting) }
  end

end

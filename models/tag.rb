require_relative('../db/sql_runner')

class Tag
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.all()
    sql = "SELECT * FROM tags"
    tag_data = SqlRunner.run(sql)
    tags = map_items(tag_data)
    return merchants
  end

  def self.map_items(tag_data)
    return tag_data.map { |tag| Tag.new(tag) }
  end
end

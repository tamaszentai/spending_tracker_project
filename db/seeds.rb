require_relative( "../models/transaction.rb" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require("pry-byebug")

Transaction.delete_all()

transaction1 = Transaction.new({
  "amount" => "10",
  "merchant" => "ASDA",
  "tag" => "Groceries"
})

transaction1.save()

transaction2 = Transaction.new({
  "amount" => "40",
  "merchant" => "Sports Direct",
  "tag" => "Clothing"
})

transaction2.save()

transaction3 = Transaction.new({
  "amount" => "60",
  "merchant" => "Playstation Store",
  "tag" => "Entertainment"
})

transaction3.save()

binding.pry
nil

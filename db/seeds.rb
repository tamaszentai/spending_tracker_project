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

merchant1 = Merchant.new({
  "name" => "Amazon"
  })

merchant1.save()

merchant2 = Merchant.new({
  "name" => "Tesco"
  })

merchant2.save()

merchant3 = Merchant.new({
  "name" => "PayPal"
  })

merchant3.save()

tag1 = Tag.new({
  "name" => "Groceries"
  })

tag1.save()

tag2 = Tag.new({
  "name" => "Bills"
  })

tag2.save()

tag3 = Tag.new({
  "name" => "Entertainment"
  })

tag3.save()

binding.pry
nil

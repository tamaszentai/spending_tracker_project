require_relative( "../models/transaction.rb" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require("pry-byebug")

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()


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

merchant4 = Merchant.new({
  "name" => "Playstation Store"
  })

merchant4.save()

merchant4 = Merchant.new({
  "name" => "Scottish Power"
  })

merchant4.save()


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

tag4 = Tag.new({
  "name" => "Clothing"
  })

tag4.save()

tag5 = Tag.new({
  "name" => "Transfer"
  })

tag5.save()

transaction1 = Transaction.new({
  "time_stamp" => "2020-02-11",
  "amount" => "10",
  "merchant_id" => merchant1.id,
  "tag_id" => tag4.id
})

transaction1.save()

transaction2 = Transaction.new({
  "amount" => "20",
  "merchant_id" => merchant2.id,
  "tag_id" => tag1.id
})

transaction2.save()

transaction3 = Transaction.new({
  "amount" => "30",
  "merchant_id" => merchant3.id,
  "tag_id" => tag5.id
})

transaction3.save()

binding.pry
nil

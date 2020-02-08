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

transaction1 = Transaction.new({
  "amount" => "10",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
})

transaction1.save()

binding.pry
nil

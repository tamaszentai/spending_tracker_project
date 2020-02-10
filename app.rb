require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transactions_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')

set(:total, Transaction.sum)

get '/' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb( :index )
end

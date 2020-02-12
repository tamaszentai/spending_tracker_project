require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transactions_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/budget_settings_controller')

require_relative('models/transaction')


get '/' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  @total = Transaction.sum

  erb( :index )
end

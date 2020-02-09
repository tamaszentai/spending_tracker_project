require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )


get '/transactions' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  @total = Transaction.sum
  erb ( :"transactions/index" )
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @merchants = Merchant.all
  @tags = Tag.all
  erb ( :"transactions/edit" )
end

post '/transactions' do
  @transaction = Transaction.new (params)
  @transaction.save()
  redirect to '/transactions'
end

post '/transactions/:id' do
  Transaction.new(params).update
  redirect to '/transactions'
end

post '/transactions/:id/delete' do
  @transaction = Transaction.find(params['id'])
  @transaction.delete
  redirect to '/transactions'
end

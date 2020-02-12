require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )


get '/tags' do
  @tags = Tag.all
  erb ( :"tags/index" )
end

get '/tags/new' do
  erb ( :"tags/new" )
end

post '/tags' do
  @tag = Tag.new (params)
  @tag.save()
  redirect to '/tags'
end

get '/tags/:id/edit' do
  @tag = Tag.find(params['id'])
  erb ( :"tags/edit" )
end

post '/tags/:id' do
  Tag.new(params).update
  redirect to '/tags'
end

post '/tags/:id/delete' do
  @tag = Tag.find(params['id'])
  @tag.delete
  redirect to '/tags'
end

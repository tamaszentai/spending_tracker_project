require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/budget_setting.rb' )
also_reload( '../models/*' )


get '/budget_settings' do
  @budgets = BudgetSetting.all
  erb ( :"budget_settings/index" )
end

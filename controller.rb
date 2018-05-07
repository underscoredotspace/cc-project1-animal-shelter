require ( 'sinatra')
require ( 'sinatra/contrib/all')
require_relative('./models/Animal')

get '/animals/adoptable' do
  @animals = Animal.adoptable()
  erb(:"animals/adoptable")
end
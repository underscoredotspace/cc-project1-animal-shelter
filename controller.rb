require ( 'sinatra')
require ( 'sinatra/contrib/all')
require_relative('./models/Animal')

get '/animals/all' do
  @animals = Animal.all()
  erb(:"animals/all")
end

get '/animals/adoptable' do
  @animals = Animal.adoptable()
  erb(:"animals/adoptable")
end

get '/animals/new' do
  @animals = Animal.new_animals()
  erb(:"animals/new")
end

get '/animals/:id/edit' do |id|
  @animal = Animal.by_id(id)
  @breeds = Animal.breeds(@animal.type_id)
  @statuses = Animal.statuses()
  erb(:"animals/edit")
end

post '/animals/:id/edit' do
  animal = Animal.new(params)
  animal.update()
  redirect to('/animals/all')
end

get '*' do 
  redirect to('/animals/all')
end
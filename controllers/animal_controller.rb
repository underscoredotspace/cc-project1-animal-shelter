require_relative('../models/Animal')
require_relative('../models/Customer')

get '/animals/all' do
  @animals = Animal.all()
  @title = "All"
  @section = "Animals"
  erb(:"animals/all")
end

get '/animals/adoptable' do
  @animals = Animal.adoptable()
  @title = "Adoptable"
  @section = "Animals"
  erb(:"animals/all")
end

get '/animals/new' do
  @animals = Animal.new_animals()
  @title = "New"
  @section = "Animals"
  erb(:"animals/all")
end

get '/animals/:id' do |id|
  @animal = Animal.by_id(id)
  @title = @animal.name
  @section = "Animals"
  erb(:"animals/view")
end

get '/animals/:id/adopt' do |id|
  @animal = Animal.by_id(id)
  @customers = Customer.approved()
  @title = "Adoption"
  @section = "Animals"
  erb(:"animals/adopt")
end

get '/animals/:id/edit' do |id|
  @animal = Animal.by_id(id)
  @breeds = Animal.breeds(@animal.type_id)
  @title = "Edit"
  @section = "Animals"
  erb(:"animals/edit")
end

post '/animals/:id/edit' do |id|
  animal = Animal.new(params)
  animal.update()
  redirect to("/animals/#{id}")
end
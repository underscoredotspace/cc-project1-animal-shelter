require_relative('../models/Animal')

get '/animals/all' do
  @animals = Animal.all()
  @title = "All"
  erb(:"animals/all")
end

get '/animals/adoptable' do
  @animals = Animal.adoptable()
  @title = "Adoptable"
  erb(:"animals/all")
end

get '/animals/new' do
  @animals = Animal.new_animals()
  @title = "New"
  erb(:"animals/all")
end

get '/animals/:id/edit' do |id|
  @animal = Animal.by_id(id)
  @breeds = Animal.breeds(@animal.type_id)
  @statuses = Animal.statuses()
  @title = "Edit"
  erb(:"animals/edit")
end

post '/animals/:id/edit' do
  animal = Animal.new(params)
  animal.update()
  redirect to('/animals/all')
end
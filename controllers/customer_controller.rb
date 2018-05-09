require_relative('../models/Customer')
require_relative('../models/Animal')
require_relative('../models/Adoption')

get '/customers/add' do
  @title = "Add"
  @section = "Customers"
  erb(:"customers/add")
end

post '/customers/add' do
  customer = Customer.new(params)
  customer.save()
  redirect to("/customers/#{customer.id}")
end

get '/customers/all' do
  @customers = Customer.all()
  @title = "All"
  @section = "Customers"
  erb(:"customers/all")
end

get '/customers/approved' do
  @customers = Customer.approved()
  @title = "Approved"
  @section = "Customers"
  erb(:"customers/all")
end

get '/customers/adoptions' do
  @adoptions = Adoption.adoptions()
  @title = "Adoptions"
  @section = "Customers"
  erb(:"customers/adoptions")
end

get '/customers/:id' do |id|
  @customer = Customer.by_id(id)
  @title = @customer.name
  @section = "Customers"
  erb(:"customers/view")
end

get '/customers/:id/edit' do |id|
  @customer = Customer.by_id(id)
  @title = "Edit"
  @section = "Customers"
  erb(:"customers/edit")
end

get '/customers/:id/adopt' do |id|
  @customer = Customer.by_id(id)
  @animals = Animal.adoptable()
  @title = "New Adoption"
  @section = "Customers"
  erb(:"customers/adopt")
end

get '/customers/:id/adopt/:animal_id' do |id, animal_id|
  @customer = Customer.by_id(id)
  @animal = Animal.by_id(animal_id)
  @title = "New Adoption"
  @section = "Customers"
  erb(:"customers/adopt_confirm")
end

post '/customers/:customer_id/adopt/:animal_id' do |customer_id, animal_id|
  adoption = Adoption.new({
    "customer_id" => customer_id, 
    "animal_id" => animal_id
  })
  adoption.save()

  redirect to("/customers/#{customer_id}")
end

post '/customers/:id/edit' do |id|
  customer = Customer.new(params)
  customer.update()
  redirect to("/customers/#{id}")
end
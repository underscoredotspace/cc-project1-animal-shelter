require_relative('../models/Customer')

get '/customers/all' do
  @customers = Customer.all()
  @title = "All"
  @section = "Customers"
  erb(:"customers/all")
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
  @title = "New Adoption"
  @section = "Customers"
  erb(:"customers/adopt")
end

post '/customers/:id/edit' do
  customer = Customer.new(params)
  customer.update()
  redirect to('/customers/all')
end
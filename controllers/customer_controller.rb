require_relative('../models/Customer')

get '/customers/all' do
  @customers = Customer.all()
  @title = "All"
  erb(:"customers/all")
end

get '/customers/:id/edit' do |id|
  @customer = Customer.by_id(id)
  @title = "Edit"
  erb(:"customers/edit")
end

post '/customers/:id/edit' do
  customer = Customer.new(params)
  customer.update()
  redirect to('/customers/all')
end
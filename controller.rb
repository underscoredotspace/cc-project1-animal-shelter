require ( 'sinatra')
require ( 'sinatra/contrib/all')

require_relative('./controllers/animal_controller')
require_relative('./controllers/customer_controller')

get '*' do 
  redirect to('/animals/all')
end
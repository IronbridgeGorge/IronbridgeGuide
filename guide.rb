require 'sinatra'


	LOCATIONS = [
		{
			:id => 1,
			:name => "The Old Furnace",
			:latitude => '',
			:longitude => ''
		},
		{
			:id => 2,
			:name => "Boy and Swan Fountain",
			:latitude => '',
			:longitude => ''
		},
		{
			:id => 3,
			:name => "Plate Railway Track",
			:latitude => '',
			:longitude => ''
		},
		{
			:id => 4,
			:name => "Carpenters Row",
			:latitude => '',
			:longitude => ''
		},
		{
			:id => 5,
			:name => "Wharf slipway",
			:latitude => '',
			:longitude => ''
		}

	]


get '/' do
  erb :home
end

get '/list' do
  erb :list
end

get '/location/:id' do |id|

  @location = LOCATIONS.select {|location| location[:id] == id.to_i }.first

  erb :location
end
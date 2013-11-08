require 'sinatra'


	LOCATIONS = [
		{
			:id => 1,
			:name => "The Old Furnace",
			:latitude => '52.640454',
			:longitude => '-2.492907'
		},
		{
			:id => 2,
			:name => "Boy and Swan Fountain",
			:latitude => '52.639927',
			:longitude => '-2.492813'
		},
		{
			:id => 3,
			:name => "Plate Railway Track",
			:latitude => '52.640342',
			:longitude => '-2.493107'
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
		},
	
		{
			:id => 6,
			:name => "Long Warehouse",
			:latitude => '52.639474',
			:longitude => '-2.492562'
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

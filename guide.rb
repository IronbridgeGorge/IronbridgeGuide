require 'sinatra'
require 'json'
require 'rdiscount'
require 'yaml'


LIST = Dir.entries('locations').select {|x| x =~ /\A.*\.md+/}

LOCATIONS = []

LIST.each do |file_name|

  file = File.join('locations', file_name)
  file_content = File.read(file)

  location = {}

  metadata = YAML.load(file_content)

  location = location.merge!(metadata) if metadata

  location_raw_content = file_content.gsub(/---(.|\n)*---/, '').strip;

  location = location.merge!({
    'content' => RDiscount.new(location_raw_content).to_html
    })

  LOCATIONS << location

end


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

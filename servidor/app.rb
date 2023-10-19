require 'sinatra'
require 'json'

get '/provincias/' do
  content_type :json
  load_data('provincias').to_json
end

get '/provincias/:id' do |id|
  content_type :json
  load_data('provincias').find { |it| it['id'] == id }.to_json
end

get '/provincias/:id/localidades' do |id|
  content_type :json
  load_data('localidades').select { |it| it['provincia']['id'] == id }.to_json
end

def load_data(key)
  # simulacion de demora
  sleep 2
  JSON.load(File.read("#{key}.json"))[key]
end
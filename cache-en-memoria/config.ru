require "redis"
require "faraday"
require "rack/request"

$redis = Redis.new
$client = Faraday.new(url: 'http://localhost:8000/')

run do |env|
  request = Rack::Request.new(env)
  intercept request
end

def intercept(request)
  key = redis_key(request)
  value = $redis.get(key)

  if value
    response = JSON.parse(value)
    [200, response['headers'], [response['body']] ]
  else
    response = forward(request)
    store_redis_value key, response if response.status == 200
    [response.status, response.headers, [response.body]]
  end
end

def redis_key(request)
  "servidor:#{request.path}:#{request.params}"
end

def store_redis_value(key, response)
  $redis.set key, {headers: response.headers, body: response.body}.to_json
  $redis.expire key, 60 * 60
end

def forward(request)
  headers = request.env.select { |it, _| it.include?('HTTP_') }.transform_keys { |it| it[5..] }
  headers.delete('HOST')
  $client.get(request.path, request.params, headers)
end
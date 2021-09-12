require 'sinatra'

get '/' do
    p request
end

post '/*' do
  puts "path: " + request.path_info
  params.each { |k,v| puts "#{k} => #{v}" }
  
  "success"
end

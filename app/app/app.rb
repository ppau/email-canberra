require File.expand_path("../email.rb", __FILE__)

$port = settings.port

get '/' do
  erb :main
end

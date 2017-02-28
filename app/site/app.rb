require File.expand_path("../email.rb", __FILE__)

$email_address = nil
$password = nil
$subject = nil
$message = nil


get '/' do
  erb :main
end

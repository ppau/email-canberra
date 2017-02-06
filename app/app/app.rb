require 'sinatra'
require 'pony'

get '/' do
  erb :main
end

get '/gmail' do
  erb :gmail
end

post '/gmail' do
  email = params[:email]
  password = params[:password]
  message = params[:message]

  Pony.mail({
    :from => email,
    :to => "laurence.stevens@carey.com.au",
    :subject => "Some Subject",
    :body => message,
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => email,
      :password             => password,
      :authentication       => :plain,
      :domain               => "localhost.localdomain"
    }
  })

end

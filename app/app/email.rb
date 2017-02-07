get '/gmail' do
  erb :gmail
end

post '/gmail' do
  email = params[:email]
  password = params[:password]
  to = params[:to]
  subject = params[:subject]
  message = params[:message]

  Pony.mail({
    :from => email,
    :to => to,
    :subject => subject,
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

  erb :gmail

end

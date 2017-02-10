
def get_emails(input)
  get = Curl.get("http://localhost:#{$port}/api/email/#{input}")
  return get.body_str
end

get '/gmail' do
  erb :gmail
end

post '/gmail' do
  email = params[:email]
  password = params[:password]
  to = params[:to]
  subject = params[:subject]
  message = params[:message]

  to = get_emails(to)
  emails = []
  to = JSON.parse(to)
  puts emails
  emails = to.split(" ")
  puts emails


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

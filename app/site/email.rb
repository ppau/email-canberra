def get_emails(input)
  port = settings.port
  get = Curl.get("http://localhost:#{port}/api/email/#{input}")
  return get.body_str
end

#make more dynamic
def send_emails_gmail(email_list, email_address, password, subject, message)
  emails = email_list

  emails.each do |item|
    Pony.mail({
      :from => email_address,
      :to => item,
      :subject => subject,
      :body => message,
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => email_address,
        :password             => password,
        :authentication       => :plain,
        :domain               => "localhost.localdomain"
      }
    })
  end

end

get '/gmail' do
  erb :email
end

get '/outlook' do
  erb :email
end

post '/gmail' do
  email_address = params[:email_address]
  password = params[:password]
  subject = params[:subject]
  message = params[:message]
  to = params[:to]

  to = get_emails(to)
  to = JSON.parse(to)

  # order if input to send_email_*() is to, email_address, password, subject, message
  send_emails_gmail(to, email_address, password, subject, message)

  erb :main
end

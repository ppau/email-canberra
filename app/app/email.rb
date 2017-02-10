
def get_emails(input)
  port = settings.port
  get = Curl.get("http://localhost:#{port}/api/email/#{input}")
  return get.body_str
end

def send_emails(input)
  emails = input

  emails.each do |item|
    Pony.mail({
      :from => $email_address,
      :to => item,
      :subject => $subject,
      :body => $message,
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => $email_address,
        :password             => $password,
        :authentication       => :plain,
        :domain               => "localhost.localdomain"
      }
    })
  end

end

get '/gmail' do
  erb :gmail
end

post '/gmail' do
  $email_address = params[:email_address]
  $password = params[:password]
  $subject = params[:subject]
  $message = params[:message]

  to = params[:to]
  to = get_emails(to)
  to = JSON.parse(to)

  send_emails(to)

  erb :main

end

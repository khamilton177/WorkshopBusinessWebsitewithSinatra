require "sinatra"
require 'sendgrid-ruby'

get "/" do
  erb :home
end

get "/Gallery" do
  erb :gallery
end

get "/product" do
  erb :product
end

get "/Contact" do
  erb :contact_form
end

post "/form-response" do
  params.inspect
  from = SendGrid::Email.new(email: params[:from])
  subject = params[:subject]
  to = SendGrid::Email.new(email: "kerryjae@live.com")
  content = SendGrid::Content.new(type: 'text/plain', value: params[:content])
  mail = SendGrid::Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  # load "email.rb"
  # redirect "/Contact"
end

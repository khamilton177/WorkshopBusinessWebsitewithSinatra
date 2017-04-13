require "sinatra"
require 'sendgrid-ruby'
include SendGrid

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
  from = Email.new(email: params[:from])
  subject = "This is my subject"
  to = Email.new(email: "kerryjae@live.com")
  content = Content.new(type: 'text/plain', value: params[:content])
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
  # load "email.rb"
  # redirect "/Contact"
end

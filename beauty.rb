require "sinatra"

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
  email.rb
  # redirect "/Contact"
end

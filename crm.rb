require 'sinatra'
require_relative 'contact'

get "/" do
  erb :index
end

get "/contacts" do
  @contacts = Contact.all
  erb :contacts
end

get "/contacts/:id" do
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get "/about" do
  erb :about
end

get "/new" do
  erb :new
end

after do
  ActiveRecord::Base.connection.close
end

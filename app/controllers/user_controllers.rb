get '/users/new' do
	erb :'users/new'
end

post '/users/new' do
	@user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users/#{@user.id}"



end




get "/users/:id" do
	@user = User.find_by(id: params[:id])
  p "******************** #{session.id}"

	erb :'users/show'
end	
	
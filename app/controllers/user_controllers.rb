get '/users/new' do
	erb :'users/new'
end

post '/users/new' do
	@user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/"	
end
	
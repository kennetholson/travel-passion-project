get '/users/new' do
	if request.xhr?
		erb :'users/new', layout: false
	else
		erb :'users/new'
	end
end

post '/users/new' do
	@user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/sessions/new"
end


get "/users/:id" do	
	@user = User.find_by(id: params[:id])
	erb :'users/show'
end	

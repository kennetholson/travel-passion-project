get '/users/new' do
	erb :'users/new'
end

post '/users/new' do
	@user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/sessions/new"
end


get "/users/:id" do	
	@user = User.find_by(id: params[:id])
	erb :'users/show'
end	
	
post '/users/:id' do
	@place = Place.find_by(country: params[:country], city: params[:city])
	if @place == nil
	@place = Place.create(country: params[:country], city: params[:city])
	end
	p @place
	@rating = Rating.new()
	redirect "/users/:id"	
end	
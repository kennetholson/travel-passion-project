get '/users/new' do
	if request.xhr?
		erb :'users/new', layout: false
	else
		erb :'users/new'
	end
end

post '/users/new' do
	@user = User.new(params[:user])
	if @user.save
    login(@user)		
	redirect "/users/#{@user.id}"
	else	 
	redirect "/users/new"
	end
end


get "/users/:id" do	
	@user = User.find_by(id: params[:id])
	erb :'users/show'
end	

get '/sessions/new' do
  if request.xhr?
    erb :'/sessions/new', layout: false
  else
    erb :'/sessions/new'
  end
end

post '/sessions/new' do

  @user = User.find_by(email: params["email"])

  if @user && @user.password == params["password"]
    login(@user)
    redirect "/users/#{@user.id}"   
  else
    @error = "Couldn't log in"
    erb :'/sessions/new'
  end
end

get '/logout' do
  logout
  redirect '/'
end
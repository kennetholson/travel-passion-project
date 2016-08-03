get '/' do
	redirect '/place'
end

get '/place' do
	erb :"place/index"
end

get '/place/:country/:city' do
	@country = params[:country]
	@city = params[:city]
	@place = Place.find_by(city: params[:city])
	p @array = @place.ratings
	erb :'/place/show'
end	


post '/place' do
	@country = params[:country]
	@city = params[:city]
	redirect "/place/#{@country}/#{@city}"
end	
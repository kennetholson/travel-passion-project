get '/' do
	redirect '/place'
end

get '/place' do
	@user = current_user
	erb :"place/index"
end

get '/place/:country/:city' do
	@country = params[:country]
	@city = params[:city]
	@place = Place.find_by(city: params[:city])
	if @place != nil
		@array = @place.ratings
	else 
		@array = []
	end 

	erb :'/place/show'

end	


post '/place' do
	@country = params[:country]
	@city = params[:city]
	@place = Place.find_by(city: params[:city])
	if @place != nil
		@array = @place.ratings
	else 
		@array = []
	end 

	if request.xhr?		
		return erb :'/place/show', layout: false, locals: {country: @counrty, city: @city}			
	else
		redirect "/place/#{@country}/#{@city}"
	end
end

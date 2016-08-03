get '/rating/new' do
	erb :'ratings/new'
end

post '/rating/new' do
	@user = current_user.id
	@place = Place.find_by(country: params[:country], city: params[:city])
	if @place == nil
	@place = Place.create(country: params[:country], city: params[:city])
	end
	p @place
	@rating = Rating.create(food: params[:food], family_friendly: params[:family_friendly], history: params[:history], sites: params[:sites],cost: params[:cost], hospitality: params[:hospitality], modernism: params[:modernism], user_id: @user, place_id: @place.id)
	p @rating
	redirect "/users/#{@user}"	
end	
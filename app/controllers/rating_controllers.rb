get '/rating/new' do
	if request.xhr?	
		erb :'ratings/new', layout: false
	else 
		erb :'ratings/new'
	end			
end

post '/rating/new' do
	@user = current_user.id
	@full_user = current_user
	@place = Place.find_by(country: params[:country], city: params[:city])
	if @place == nil
		@place = Place.create(country: params[:country], city: params[:city])
	end
	@rating = Rating.create(food: params[:food], family_friendly: params[:family_friendly], history: params[:history], sites: params[:sites],cost: params[:cost], hospitality: params[:hospitality], modernism: params[:modernism], user_id: @user, place_id: @place.id)

	if request.xhr?
		erb :'users/_show', layout: false, locals: {rating: @rating}
	else	
		redirect "/users/#{@user}"
	end	

end	

delete '/rating/:id' do
	@user = current_user.id
	@rating = Rating.find(params[:id])
	@rating.destroy
	redirect "/users/#{@user}"
end

get '/rating/:id/edit' do
	@rating = Rating.find(params[:id])
	p @rating
	if request.xhr?		
		erb :'ratings/edit', layout: false
	else
		erb :'ratings/edit'
	end		
end

put '/rating/:id' do
	@user = current_user.id	
	@rating = Rating.find(params[:id])
	@rating.update(food: params[:food], family_friendly: params[:family_friendly], history: params[:history], sites: params[:sites],cost: params[:cost], hospitality: params[:hospitality], modernism: params[:modernism])

	redirect "/users/#{@user}"
end	
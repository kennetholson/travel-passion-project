helpers do
# finds user if logged in
	def login(user)
		session[:id] = user.id
	end	
	
	def authenticate(password)
		self.password == password
	end	
	
	def current_user
		@current_user ||=User.find(session[:id]) if session[:id]
	end
	
	def logout
		session[:id] = nil
	end
end
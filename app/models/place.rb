class Place < ActiveRecord::Base
	has_many :ratings
	has_many :users, :through => :ratings
  # Remember to create a migration!
end

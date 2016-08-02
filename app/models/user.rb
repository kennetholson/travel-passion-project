class User < ActiveRecord::Base
	has_many :places, :through => :ratings
	has_many :ratings
end

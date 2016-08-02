class Places < ActiveRecord::Migration
	

  def change
  	  	create_table :places do |t|
  	  		t.string :country, null: false
  	  		t.string :city, null: false
  	  	end	
  end
end

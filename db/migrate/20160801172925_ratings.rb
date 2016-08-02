class Ratings < ActiveRecord::Migration
	

  def change
  	create_table :ratings do |t|
      t.integer :food, null: false
      t.integer :family_friendly, null: false
      t.integer :history, null: false
      t.integer :sites, null: false
      t.integer :cost, null: false
      t.integer :hospitality, null: false
      t.integer :modernism, null: false
      t.integer :user_id, null: false
      t.integer :place_id, null: false 

    end  
  end
end

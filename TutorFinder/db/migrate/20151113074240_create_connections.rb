class CreateConnections < ActiveRecord::Migration
    
	def up
        
        create_table :connections do |t|
			
            t.integer "user_id", :null => false
            t.integer "contact_id", :null => false
			 
			t.timestamps null: false
		end
        
	end
	
	def down
		drop_table :connections
	end
end

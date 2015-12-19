class CreateUsers < ActiveRecord::Migration
    def up
		create_table :users do |t|	
			t.string "first_name", :null => false, :limit => 100
			t.string "last_name", :null => false, :limit => 100
			t.string "email", :null => false, :limit => 100
			t.string "tel_number", :default => "", :limit => 100
			t.string "password_digest", :null => false
            t.integer "role", :null => false
			t.boolean "is_admin", :default => false
			
			t.timestamps null: false
		end
	end
	
	def down
		drop_table :users 

	end
end

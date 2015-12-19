class CreateCourses < ActiveRecord::Migration
	def up
		create_table :courses do |t|
			
			t.string "department", :null => false, :limit => 100
            t.string "course_number", :null => false, :limit => 100
			t.string "course_name", :null => false, :limit => 100
			t.string "description", :null => false, :limit => 250
			
			t.timestamps null: false
		end
	end
	
	def down
		drop_table :courses 
	end
end
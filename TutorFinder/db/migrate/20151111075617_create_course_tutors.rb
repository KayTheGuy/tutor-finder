class CreateCourseTutors < ActiveRecord::Migration
	def up
		create_table :course_tutors do |t|
			
			t.integer "user_id", :null => false
			t.integer "course_id", :null => false
			t.string "description", :limit => 250
			 
			t.timestamps null: false
		end
	end
	
	def down
		drop_table :course_tutors
	end
end

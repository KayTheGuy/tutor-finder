class CreateReviews < ActiveRecord::Migration
    
    def up
        create_table :reviews do |t|
			
            t.integer "user_id", :null => false
            t.integer "tutor_id", :null => false
            t.integer "course_id", :null => false
            t.integer "rate", :null => false
            t.string "comment", :null => false
            t.timestamps null: false
        end
    end
    
    def down
        drop_table :reviews 
    end
end

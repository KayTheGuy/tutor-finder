class AddRatingToCourseTutors < ActiveRecord::Migration
    def up
        add_column :course_tutors, :rate, :decimal, :default => 0
    end
    
    def down
        remove_column :course_tutors, :rate, :decimal, :default => 0
    end
end
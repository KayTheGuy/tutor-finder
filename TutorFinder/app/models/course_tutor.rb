class CourseTutor < ActiveRecord::Base
    
    belongs_to :user
	belongs_to :course
    
    validates :description,  :length => {:maximum => 250}
	
end

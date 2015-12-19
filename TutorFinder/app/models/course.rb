class Course < ActiveRecord::Base    
	has_many :course_tutors, :dependent => :destroy
	has_many :users, :through => :course_tutors
	
	# database integrity check
	#====================================================================
	validates :department, :presence => true, :length => {:maximum => 100}
	validates :course_number, :presence => true, :length => {:maximum => 100}
	validates :course_name, :presence => true, :length => {:maximum => 100}
	validates :description, :presence => true, :length => {:maximum => 250}

end
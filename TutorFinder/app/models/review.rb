class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :tutor, :class_name => "User"
    belongs_to :course
    
    # database integrity check
	#====================================================================
    validates :user_id, :presence => true
    validates :tutor_id, :presence => true
    validates :course_id, :presence => true
    validates :rate, :presence => true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 5 }
    validates :comment, :presence => true
    
    
end

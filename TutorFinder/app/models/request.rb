class Request < ActiveRecord::Base
    
    alias_attribute :start_time, :apptDate

    #----------------------------------------
    validates :tutorID, presence: true
    validates :studentID, presence: true
    validates :courseID, presence: true
    validates :apptDate, presence: true
    validates :startTime, presence: true
    validates :endTime, presence: true
end

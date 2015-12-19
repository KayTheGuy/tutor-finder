class SearchTutorController < ApplicationController
    
    def index
        #get all the tutors for current course
        if Course.exists?( :id => params[:id])
           @course = Course.find(params[:id])
           @tutors = @course.users.select('users.*, course_tutors.*')
       end
    end
    
    def reqst
        redirect_to(:controller => 'requests', :action => 'new',
            :tutor_id => params[:tutor_id],
            :cours_id => params[:cours_id])
    end
    
    private
    def course_params
        params.require(:course).permit(:id, :department)
	end
end
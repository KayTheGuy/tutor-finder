class CourseController < ApplicationController
    
    def search_department
        @departments = Course.pluck(:department).uniq.sort.each
    end
    
  
    def search_course
        @courses = Course.where( :department => params[:department] )
    end
    
    def select_course
        @department = params[:department]
        @courses = Course.where( :department => @department)
        @departments = Course.pluck(:department).uniq.sort.each
    end
    
    def update_course
        @uid = session[:user_id]
        @course_tutor = CourseTutor.where(:user_id => @uid, :course_id => params[:id]).first
    end
    
    def update_description
        @course_tutor = CourseTutor.find(params[:id])
        update = @course_tutor.update(course_tutor_params)
        if update
            flash[:notice] = "Description was successfully updated."
            redirect_to(:controller => 'profiles', :action => 'index', :id => session[:user_id])
        else
            flash[:notice] = "Oops. Something went wrong."
            redirect :back
        end
    end
    
    def add_course
        tutor = User.find(session[:user_id])
        course = CourseTutor.new( :user_id => tutor.id, :course_id => params[:id] )
        if Course.where(:id => params[:id]).exists?
            if tutor.role != 0
                #check if tutor has already have this course
                if CourseTutor.exists?( :user_id => tutor.id, :course_id => params[:id] )
                    flash[:notice] = "You already have this course in your list. Choose a new course."
                    redirect_to(:back) 
                elsif  course.save
                    flash[:notice] = "Course is added to your list successfully."
            redirect_to(:controller => 'profiles', :action => 'index', :id => session[:user_id])
                else
                    flash[:notice] = "Something went wrong. Course is not added to your list. Please try again."
                    redirect_to(:back)
                end       
            else
                flash[:notice] = "You don't have a 'tutor role. Update your role in order to tutor a course.'"
                redirect_to(:controller => 'users', :action => 'edit', :id => tutor.id)
            end
        else
            flash[:notice] = "There is no such course. Nice Try!!!"
            redirect_to(:controller => 'profiles', :action => 'index', :id => session[:user_id])
        end
    end
    
    #show the course to be deleted to user
    def remove_course
        #check if user has the requested course in his list
        if CourseTutor.exists?( :user_id => session[:user_id], :course_id => params[:id] )
            @course = Course.where( :id => params[:id]).first
        else
            flash[:notice] = "You don't have the requested course in your course list."
            redirect_to(:controller => 'profiles', :action => 'index', :id => session[:user_id])
        end
    end
    
    #deleting courses from database
    def delete_course
        @uid = session[:user_id]
		course = CourseTutor.destroy_all( :user_id => @uid, :course_id => params[:id] )
		
		if course
			flash[:notice] = "The course was destroyed successfully."
		else
			flash[:error] = "Ooops. There was a problem. Please try again."		
		end
        redirect_to(:controller => 'profiles', :action => 'index', :id => session[:user_id])
    end

    private
    def course_tutor_params
        params.require(:course_tutor).permit(:id, :user_id, :course_id, :description, :rate)
	end
end

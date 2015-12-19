class AppointmentController < ApplicationController
    
    def index
        @user_info = User.find(session[:user_id])
        
        if @user_info.role == 2
            @calendar = Request.where("(tutorID = :id OR studentID = :id) AND isConfirmed =1", {id: session[:user_id]})
        elsif @user_info.role == 1
            @calendar = Request.where(:tutorID => session[:user_id], :isConfirmed => 1)
        else
            @calendar = Request.where(:studentID => session[:user_id], :isConfirmed => 1)
        end
        
        @agenda_student = Request.where(:studentID => session[:user_id], :isConfirmed => 1)
                            .order(:apptDate, :startTime)
                            .all.paginate(:per_page => 5, :page => params[:page])
        @agenda_tutor = Request.where(:tutorID => session[:user_id], :isConfirmed => 1)
                            .order(:apptDate, :startTime)
                            .all.paginate(:per_page => 5, :page => params[:page])
    end
    
    def edit
        @appointment = Request.find(params[:id])
    end
    
    def show
        @request = Request.find(params[:id])
    end
    
    def update
        @appointment = Request.find(params[:id])
        if @appointment.update(appointment_params)
            redirect_to :action => 'show'
        else
            render 'edit'
        end
    end
    
    def destroy
        @request = Request.find(params[:id])
        @request.destroy
        redirect_to :back
    end
    
    private
    def appointment_params
        params.require(:appointment).permit(:studentID, :tutorID, :courseID, :apptDate, :startTime, :endTime, :note)
    end

end

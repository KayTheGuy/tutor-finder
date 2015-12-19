class RequestsController < ApplicationController
    
    def pending
        @requests = Request.where(:tutorID => session[:user_id], :isConfirmed => 0).order(:apptDate, :startTime).all
        @numRequests = Request.where(:tutorID => session[:user_id], :isConfirmed => 0).count
        if !Request.exists?(:tutorID => session[:user_id], :isConfirmed => 0)
            flash.now[:notice] = "You don't have any pending appointment request at the moment."
        end
    end
    
    def confirm
        @request = Request.find(params[:id])
        @request.update_attribute(:isConfirmed, 1)
        redirect_to action: 'pending', :id => session[:user_id]
    end
    
    def show
        @request = Request.find(params[:id])
    end
    
    def allnew
        user = User.find(params[:user_id])
        if  (user.id == session[:user_id] &&
             params[:user_id] != params[:tutor_id] &&
             User.where(:id => params[:user_id]).exists? &&
             User.where(:id => params[:tutor_id]).exists? && 
             User.where(:id => params[:tutor_id]).first.role != 0)
            
            @tutor_cours = CourseTutor.select("*").joins(:course).where(:user_id => params[:tutor_id]).all
            @request = Request.new(tutorID: params[:tutor_id])
        else
            flash[:notice] = "Can not submit this request!(Course must be selected)!"
            redirect_to(:back)
        end
    end
    
    def new
        @request = Request.new(tutorID: params[:tutor_id], courseID: params[:cours_id])
    end
    
    def edit
        @request = Request.find(params[:id])
    end
    
    def create
        user = User.find(request_params[:studentID])
        tutor = User.find(request_params[:tutorID])
        
        @request = Request.new(request_params)
        if  (user.id == session[:user_id] &&
             user.id != tutor.id &&
             User.where(:id => user.id).exists? &&
             User.where(:id => tutor.id).exists? && 
             Course.where(:id => request_params[:courseID]).exists? && 
             User.where(:id => tutor.id).first.role != 0)
        
            if @request.save
                flash[:notice] = "Your request was created successfully!"
                redirect_to :controller => 'profiles', :action => 'index', :id => session[:user_id]
            else
                render 'new'
            end
        else
            flash[:notice] = "Can not create this request Nice Try!"
            redirect_to(:back)
        end
    end
    
    def update
        @request = Request.find(params[:id])
        if @request.update(request_params)
            redirect_to @request
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
    def request_params
        params.require(:request).permit(:studentID, :tutorID, :courseID, :apptDate, :startTime, :endTime, :note)
    end
    
end

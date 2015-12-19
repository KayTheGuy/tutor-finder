class UsersController < ApplicationController
	
	# no need to be logged in, in order to access the actions
    skip_before_action :require_login, :only => [:new,:create]
	
	
	def index
	end 

	def show
		x = params[:id]
		redirect_to({:contoller => 'profiles', :action => 'index', :id => x })
	end

	def new
		@user = User.new
	end

	def edit
        @user = User.find(session[:user_id])
	end
	
	#Creating new user
	#If successful redirect to his/her profile
	def create
        
		@user = User.new(user_params) 
        if !User.where( :email => @user.email ).blank?
			#TODO add already member ? ---> # 
            #TODO remember ---> # 
            #login=================================================
            
            flash[:error] = "User already exist with this email. If you are already a member please log in."
            #format.html { redirect_to(:action =>'new', notice: 'Registration received.') }
            redirect_to( :action => 'new', notice: 'User already exist with this email. If you are already a member please log in.')
        elsif  @user.save
            #send user an email
            UserMailer.signup_confirmation(@user).deliver
			#go to user's profile
            #storing the user's id and name in session for later access
			session[:user_id] = @user.id
			session[:user_name] = @user.first_name
            flash[:notice] = "Welcome #{@user.first_name} your account has been created successfully!"
			redirect_to({:controller => 'profiles', :action => 'index', :id => @user.id})
		else
			flash[:error] = "Unable to save data. Please try again."
            render 'new'
        end
	end 

	def update 
        @user = User.find(session[:user_id])

        if @user.update_attributes(user_params)
            flash[:notice] = "Your account has been updated successfully!"
		    redirect_to({:controller => 'profiles', :action => 'index', :id => @user.id})
		else
            render 'edit'
		end
	end

    def deleteUser
        user = User.find(session[:user_id])
        redirect_to(:action => 'remove')
    end
    def destroy
        @user = User.find(session[:user_id])
        @user.destroy
        #Mark user as not logged-in
		session[:user_id] = nil
		session[:user_name] = nil
        redirect_to(:controller => 'home', :action => 'index')
    end


	private
	def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :tel_number, :password, :password_confirmation, :role, :photo)
	end
end

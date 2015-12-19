class AccessController < ApplicationController
	
	# no need to be logged in, in order to access the actions
	skip_before_action :require_login
	

	def login

	end

	def attempt_login
		#check if user has input both username and password
		if params[:email].present? && params[:password].present? 
			#check if user exist
			matched_user = User.where(:email => params[:email]).first
			#check if user has input the right password
			if matched_user
				authorized_user = matched_user.authenticate(params[:password])
			end
		end

		if authorized_user
			#storing the user's id and name in session for later access
			session[:user_id] = authorized_user.id
			session[:user_name] = authorized_user.first_name
			flash[:notice] = "You have successfully logged in."
			#TODO redirect to user's profile page
			redirect_to({:controller => 'profiles', :action => 'index', :id => matched_user.id})
		else		
			flash[:notice] = "Invalid email or password. Please try again."
            redirect_to( :action => 'login' , :id => session[:user_id])
		end

	end

	def logout
		#Mark user as not logged-in
		session[:user_id] = nil
		session[:user_name] = nil
		flash[:notice] = "You have successfully logged out."
		redirect_to( :controller => 'access', :action => 'login' )
	end
end

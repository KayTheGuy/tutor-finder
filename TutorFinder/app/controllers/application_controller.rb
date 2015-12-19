class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	#all controllers require user to be logged in except where specified
	before_action :require_login
	#Checks if the user is logged in
	#Used in other controllers to give access to users
    
    #search box in navigation
#    before_filter :navbar_search
#    def navbar_search
#        redirect_to(:controller => 'member', :action => 'index')
#    end
    
	private
    def require_login
		#making sure the user is logged in
		unless session[:user_id]
			flash[:notice] = "Please log in first."
			redirect_to(:controller => 'access', :action => 'login')
			return false #halt the action_before
		else
			return true
		end
    end
    

    
end

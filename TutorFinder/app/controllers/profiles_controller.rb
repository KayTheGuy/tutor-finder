class ProfilesController < ApplicationController
  
  helper_method :sort_column, :sort_direction
    
  def member
      
      @member = User.find(params[:id])
      @loggedin_user = User.where(:id => session[:user_id]).first
      
      if @member != @loggedin_user
          #Connection status is True if exists and false if not exists
          @connection_status = Connection.exists?(:user_id => @loggedin_user.id ,:contact_id =>@member.id)
      else
          redirect_to(:action => 'index', :id => params[:id])
      end
      
      @member_contacts = @member.contacts
      @courses = @member.courses
      @member_courses = @member.course_tutors
      @member_reviews = @member.inverse_reviews
      @member_reviews_sorted = @member_reviews.order(id: :desc).paginate(:per_page => 5, :page => params[:page])
      
      
      @review = Review.new
  end

#  def update_rate
#      @member = User.find(params[:member_id])
#  end

  def search
      @loggedin_user = User.where(:id => session[:user_id]).first
      @users_search =  User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end
    
  def add #add to contacts
      
      @contact = User.find(params[:contact_id])
      if Connection.where(:user_id => params[:id], :contact_id => params[:contact_id]).exists?
            flash[:notice] = "#{@contact.first_name} is already to your contacts!"
            redirect_to(:back)
      elsif params[:id] ==  params[:contact_id]
          flash[:notice] = "You can not add yourself to your contact!"
            redirect_to(:back)
      else
            connection = Connection.create(:user_id => params[:id], :contact_id => params[:contact_id])
            flash[:notice] = "#{@contact.first_name} is now successfully added to your contacts!"
            redirect_to(:back)
      end
      
  end

  def remove #remove from contacts
         
      @contact = User.find(params[:contact_id])
      if Connection.where(:user_id => params[:id], :contact_id => params[:contact_id]).exists?
         Connection.where(:user_id => params[:id], :contact_id => params[:contact_id]).destroy_all
         flash[:notice] = "#{@contact.first_name} is successfully removed from  your contacts"
         redirect_to(:back)
      else
         flash[:notice] = " Unable to remove #{@contact.first_name} from your contacts"
         redirect_to(:back)
      end

  end
    
    def index
        @loggedin_user = User.find(params[:id])
        #return courses for only tutors
      if @loggedin_user.role != 0
          @testTutor = 1
          @courses = @loggedin_user.courses
          @departments = Course.pluck(:department).uniq.sort.each
      end
      if  @loggedin_user.id == session[:user_id]       
            @contacts= @loggedin_user.contacts
            @contacts_sorted = @contacts.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
      else
            flash[:notice] = "You don't have permission to access the requested page."
            redirect_to(:action => 'index', :id => session[:user_id])
      end
        
    end
    
    private
  
      def sort_column
          User.column_names.include?(params[:sort]) ? params[:sort] : "id"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end

end


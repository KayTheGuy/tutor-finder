class ReviewsController < ApplicationController

  def create
      
          @review = Review.new(review_params)
          @loggedin_user = User.where(:id => session[:user_id]).first
          @member = User.find(review_params[:tutor_id]) 
      
          if (@review.user_id != @loggedin_user.id ||
             @review.user_id == @review.tutor_id  || 
             @review.rate > 5   ||
             @review.rate < 1   ||
             Course.find(@review.course_id).blank? )
              
              flash[:notice] = "Nice Try!!!"
              redirect_to( :back)
              
          else
              
                if !Review.where( :user_id => @review.user_id, :tutor_id => @review.tutor_id, :course_id => @review.course_id ).blank?

                    flash[:notice] = "You have already rated this tutor for this course!"
                    redirect_to( :back)
                elsif  @review.save

                    flash[:notice] = "Your review was successfully submitted!"
                    redirect_to( :back)
                else
                    flash[:notice] = "Unable to submit review. Make sure you choose a rating and write a comment!"
                    redirect_to( :back)
                end

              member = User.find(@review.tutor_id)
              avg_course_rating = member.inverse_reviews.where(:course_id => @review.course_id).average(:rate)
              CourseTutor.where(:user_id => @review.tutor_id , :course_id => @review.course_id).update_all(:rate => avg_course_rating)
              
          end
  end

  def update
#        @review = Review.find(session[:user_id])
#
#        if @review.update_attributes(user_params)
#            flash[:notice] = "Your review has been updated successfully!"
#            redirect_to( :back)
#		else
#            flash[:notice] = "Unable to edit review. Please try again!"
#            redirect_to( :back)
#		end
  end

    def remove
    @review = Review.find(params[:review_id])
    if @review.destroy
        flash[:notice] = "Your review was deleted successfully!"
        redirect_to( :back)
    else
        flash[:notice] = "Your review was not deleted. Please try again!"
        redirect_to( :back)
    end
      
  end

	private
    def review_params
        params.require(:review).permit(:user_id, :tutor_id, :course_id, :rate, :comment)
	end
end
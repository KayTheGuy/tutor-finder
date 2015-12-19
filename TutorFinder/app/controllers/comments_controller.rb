class CommentsController < ApplicationController
	
    def create
        
        if @user = User.where( :id => comment_params[:user_id]).exists? && Post.where( :id => comment_params[:post_id]).exists?
            user = User.find( comment_params[:user_id] )
            if  user.id == session[:user_id]
                @comment = Comment.create(comment_params)
                redirect_to (:back)
            else
                flash[:notice] = "It seems that you're trying to mess with our website. Nice Try!"
                redirect_to (:back)
            end
        else
            flash[:notice] = "It seems that you're trying to mess with our website. Nice Try!"
            redirect_to (:back)
        end

	end

	def destroy
		x = session[:user_id]
		@current_user = User.find(x)	
    	@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to (:back)
	end 
    
    private
    def comment_params
        params.require(:comment).permit(:body, :post_id, :user_id)
	end
end





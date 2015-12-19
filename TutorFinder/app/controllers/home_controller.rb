class HomeController < ApplicationController
	# no need to be logged in, in order to access the actions
	skip_before_action :require_login

	def index
        
        if Review.exists?
            @maxrate = Review.maximum(:rate)
            @review = Review.where( :rate => @maxrate ).last
            @toptutor = User.where(:id => @review.tutor_id).first
        end
	end
    
	def about
	end

	def team
	end

	def contact
	end

	def blog
	end

end
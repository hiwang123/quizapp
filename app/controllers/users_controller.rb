class UsersController < ApplicationController
	def new
		@user = User.new 
	end
	
	def create
		if user_params[:name].blank? or user_params[:email].blank? or user_params[:password].blank? or user_params[:school].blank?
			flash[:error] = 'User informations cannot be null'
			redirect_to :action => :new
		elsif not User.where(email: user_params[:email]).empty?
			flash[:error] = 'This email is registered'
			redirect_to :action => :new
		else
			@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to '/'
			else
				redirect_to :action => :new
			end
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :school, :password)
		end

end

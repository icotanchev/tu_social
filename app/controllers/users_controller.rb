class UsersController < ApplicationController

	def index
		@search = User.where(role: 'student').search(params[:q])
    @users = @search.result
	end

	def teachers
		@search = User.where(role: 'professor').search(params[:q])
		@users = @search.result
		render :index
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'User was successfully updated.'
      redirect_to edit_user_url(@user.id)
    else
    	flash[:warning] = 'User was not updated!'
      redirect_to action: :edit
    end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :pin, :faculty_number, :send_emails, :email)
	end
end

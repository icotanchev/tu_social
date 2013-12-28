class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!#, :only => [:login]
#  ssl_required :login # you have to set up ssl and ssl_requirement

  # def login
  #   @user = current_user
  #   respond_to do |format|
  #     format.html {render :text => "#{@user.id}"} 
  #     format.js {render :json => "#{@user.id}" }   
  #   end
  # end
end

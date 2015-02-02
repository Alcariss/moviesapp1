class SessionsController < ApplicationController
  before_filter :signed_in?
  def new
  end

  def create
	user=User.find_by_name(params[:password])
	if user && user.authenticate(params[:password])
		session[:user_id]=user.id
		redirect_to session[:return_to] || root_path
	else
		flash.now[:error]="Invalid credentials."
		render 'new'
	end
  end

  def destroy
	if signed_in?
		session[:user_id] = nil
	else
		flash[:notice] = "Sign in first"
	end
	redirect_to root_path
  end
end

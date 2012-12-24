class SessionsController < ApplicationController
  def login_page
  end

  def login
  	user = User.find_by_email(params[:email])

  	if user != nil && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "You've been logged in, #{user.name}."
  	else
  		redirect_to login_page_url, :notice => "You're not the site administrator."
  	end
  end

  def logout
  	reset_session
  	redirect_to root_url
  end
end

class HomeController < ApplicationController
  def index
  	if session[:user_id]
  		redirect_to '/images/new'
  	end
  end

  def about
  end
end

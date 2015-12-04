class UserSessionController < ApplicationController

  def new
    session[:user] = 1
  end

end

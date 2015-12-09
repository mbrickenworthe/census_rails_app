class UserSessionController < ApplicationController

  def new
    @person = Person.new
    session[:user] = 1
  end

  def create
    redirect_to about_path
    binding.pry
  end

end

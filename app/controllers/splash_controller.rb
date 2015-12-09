class SplashController < ApplicationController

  def page
    @current_user = nil
    @people = Person.all
  end


end

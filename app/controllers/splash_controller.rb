class SplashController < ApplicationController

  def page
    @current_user = nil
    @people = Person.where(:user => [nil, current_user])
  end


end

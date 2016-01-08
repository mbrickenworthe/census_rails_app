class SplashController < ApplicationController

  def page
    @famous_people = Person.where(user: nil)
    @family_people = Person.where(user: current_user)
  end


end

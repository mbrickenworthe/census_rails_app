class PersonDataController < ApplicationController

  def index
    @person_data = PersonDatum.where(person: Person.where(user: current_user))
    @key = MyApp.config.google_api_key
    @users = Person.where(user: current_user)
    @current_user = Person.where(user: current_user, active_user: true).first
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat(user.latitude)
      marker.lng(user.longitude)
      marker.infowindow("#{user.name}: #{user.address_string}")
    end
  end

end

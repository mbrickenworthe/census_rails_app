class PersonDataController < ApplicationController

  def index
    @person_data_written = PersonDatum.where(person: Person.where(user: current_user))
    @person_data_map_data = PersonDatum.where(person: Person.where(:user => [current_user, nil]))
    @key = MyApp.config.google_api_key
    @current_user_people = Person.where(:user => [current_user, nil])
    @circle_hash = []
    @current_user_person_object = Person.where(user: current_user, active_user: true).first
    @hash = Gmaps4rails.build_markers(@current_user_people) do |user, marker|
      marker.lat(user.latitude)
      marker.lng(user.longitude)
      marker.infowindow("#{user.name}: #{user.address_string}")
      marker.picture({url: user.photo.url(:thumb), width: 32, height: 32})
    end
    @person_data_map_data.each do |details|
      @circle_hash.push({lng: details.person.longitude, lat: details.person.latitude, radius: details.radius_of_a_circle, strokeColor: "#FF0000"})
    end
  end

end

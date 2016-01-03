class PersonDataController < ApplicationController

  def index
    @person_data = PersonDatum.where(person: Person.where(user: current_user))
    @key = MyApp.config.google_api_key
    @current_user_people = Person.where(user: current_user)
    @circle_hash = []
    @current_user_person_object = Person.where(user: current_user, active_user: true).first
    @hash = Gmaps4rails.build_markers(@current_user_people) do |user, marker|
      marker.lat(user.latitude)
      marker.lng(user.longitude)
      marker.infowindow("#{user.name}: #{user.address_string}")
      # marker.picture({url: "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png", width: 32, height: 32})
    end
    @hash2 = Gmaps4rails.build_markers(@current_user_people) do |user, marker|
      marker.lat(user.latitude)
      marker.lng(user.longitude)
      marker.radius(10000)
      marker.type

    end 
    @person_data.each do |details|
      @circle_hash.push({lng: details.person.longitude, lat: details.person.latitude, radius: details.sq_miles_to_meters, strokeColor: "#FF0000"})
    end
  end

end

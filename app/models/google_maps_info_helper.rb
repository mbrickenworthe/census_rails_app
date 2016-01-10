class GoogleMapsInfoHelper

  attr_accessor :final_hash
  attr_reader :person, :person_data_object

  def initialize(person_data_object)
    @person = person_data_object.person
    @person_data_object = person_data_object
    @final_hash = {}
    build_hash
  end

  def build_hash
    @final_hash[:marker_location] = coordinates
    @final_hash[:radius] = person_data_object.radius_of_a_circle.round(2)
    @final_hash[:image_url] = person.photo.url(:thumb)
    @final_hash[:info_window_text] = "#{@person.name}: #{@person.address_string}"
    @final_hash
  end

  def coordinates
    {lat: person.latitude, lng: person.longitude}
  end

end
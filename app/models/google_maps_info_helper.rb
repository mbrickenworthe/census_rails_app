class GoogleMapsInfoHelper

  attr_accessor :final_hash, :circle_hash_one, :circle_hash_two, :circle_hash_three, :circle_hash_four
  attr_reader :person, :person_data_object

  def initialize(person_data_object)
    @person = person_data_object.person
    @person_data_object = person_data_object
    @final_hash = {}
    @circle_hash_one = {}
    @circle_hash_two = {}
    @circle_hash_three = {}
    @circle_hash_four = {}
    build_all_hashes
  end

  def build_all_hashes
    build_hash
    build_circle_hash_one
    build_circle_hash_two
    build_circle_hash_three
    build_circle_hash_four
  end

  def build_hash
    @final_hash[:marker_location] = coordinates
    @final_hash[:radius] = person_data_object.radius_of_a_circle_in_meters(person_data_object.person_per_sq_miles_math(person_data_object.gender_age_and_race_pop))
    @final_hash[:image_url] = person.photo.url(:thumb)
    @final_hash[:info_window_text] = "#{@person.name}: #{@person.address_string}"
    @final_hash
  end

  def build_circle_hash_one
    @circle_hash_one[:api_radius] = person_data_object.radius_of_a_circle_in_meters(person_data_object.person_per_sq_miles_math(person_data_object.gender_pop))
    @circle_hash_one[:circle_color] = "#551A8B"
    @circle_hash_one[:marker_location] = coordinates
  end

  def build_circle_hash_two
    @circle_hash_two[:api_radius] = person_data_object.radius_of_a_circle_in_meters(person_data_object.person_per_sq_miles_math(person_data_object.gender_race_pop))
    @circle_hash_two[:circle_color] = "#488214"
    @circle_hash_two[:marker_location] = coordinates
  end

  def build_circle_hash_three
    @circle_hash_three[:api_radius] = person_data_object.radius_of_a_circle_in_meters(person_data_object.person_per_sq_miles_math(person_data_object.gender_age_pop))
    @circle_hash_three[:circle_color] = "#FFB00F"
    @circle_hash_three[:marker_location] = coordinates
  end

  def build_circle_hash_four
    @circle_hash_four[:api_radius] = person_data_object.radius_of_a_circle_in_meters(person_data_object.person_per_sq_miles_math(person_data_object.age_pop))
    @circle_hash_four[:circle_color] = "#236B8E"
    @circle_hash_four[:marker_location] = coordinates
  end

  def coordinates
    {lat: person.latitude, lng: person.longitude}
  end

end
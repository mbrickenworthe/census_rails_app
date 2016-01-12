class PersonDatum < ActiveRecord::Base
  belongs_to :person

  before_save :set_up

  def set_up
    parsed_call       = JSON.parse(json_hash)
    self.state_pop = parsed_call[1][0]
    self.age_pop = ((parsed_call[1][5]).to_i + (parsed_call[1][6]).to_i).to_s
    self.gender_pop = parsed_call[1][1]
    self.gender_race_pop = parsed_call[1][2]
    self.gender_age_pop   = parsed_call[1][3]
    self.gender_age_and_race_pop = parsed_call[1][4]
  end


  def person_per_sq_miles_math(census_api_number)
    milage = (person.state.land_area.to_f / census_api_number.to_f) 
    milage
  end

  def diameter_of_a_circle(area_of_circle)
    devided_number = ( area_of_circle / Math::PI)
    sqrt = Math.sqrt(devided_number)
    sqrt * 2
  end

  def radius_of_a_circle_in_meters(area_of_circle)
    devided_number = ( area_of_circle / Math::PI)
    sqrt = Math.sqrt(devided_number)
    sqrt * 1609.34
  end

  def update_census_data
    cencus = CensusCall.new(self.person)
    self.json_hash = cencus.call_data
    set_up
    self
  end

end

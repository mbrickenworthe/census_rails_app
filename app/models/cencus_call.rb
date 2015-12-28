class CencusCall < ActiveRecord::Base

attr_reader :person, :api_front, :api_back, :api_post_key, :key, :api_gender_number, :api_race, :api_gender_age_number

  def initialize(person_object)
    @api_front =  "http://api.census.gov/data/2010/sf1?key="
    @key = MyApp.config.secret_api_key
    @api_post_key = "&get=PCT0120001" 
    @api_back = "&for=state:" 
    @person = person_object
    @api_race = person.race.race_letter
    if person.male
      @api_gender_number = "002"
      if (person.age + 3).to_s.length == 1
        @api_gender_age_number = "00" + (person.age + 3).to_s
      elsif (person.age + 3).to_s.length == 2
        @api_gender_age_number = "0" + (person.age + 3).to_s
      else
        @api_gender_age_number = (person.age + 3).to_s
      end
    else
      @api_gender_number = "106"
      if (person.age + 7).to_s.length == 1
        @api_gender_age_number = "10" + (person.age + 7).to_s
      elsif (person.age + 7).to_s.length == 2
        @api_gender_age_number = "1" + (person.age + 7).to_s
      else
        @api_gender_age_number = (person.age + 7).to_s
      end
    end
  end

  def make_string
    string = api_front + key + api_post_key + combine_api_methods + api_back + person.state.state_number
  end

  def combine_api_methods
    total_gender_population + total_gender_by_race + total_gender_by_age + total_gender_by_age_and_race
  end

  def make_call
    call = RestClient.get(make_string)
    parsed_call = JSON.parse(call)
    binding.pry
  end

  def total_gender_population
    ',PCT0120' + api_gender_number
  end

  def total_gender_by_race
    ',PCT012' + api_race + api_gender_number
  end

  def total_gender_by_age
    ',PCT0120' + api_gender_age_number
  end

  def total_gender_by_age_and_race
    ',PCT012' + api_race + api_gender_age_number
  end

end

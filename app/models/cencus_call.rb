class CencusCall < ActiveRecord::Base

attr_reader :person, :api_front, :api_back, :api_post_key, :key

  def initialize(person_object)
    @api_front =  "http://api.census.gov/data/2010/sf1?key="
    @key = MyApp.config.secret_api_key
    @api_post_key = "&get=PCT0120001" 
    @api_back = "&for=state:" 
    @person = person_object
  end

  def making_string
    string = api_front + key + api_post_key + api_back + person.state.state_number
  end

  def make_call
    call = RestClient.get(making_string)
    parsed_call = JSON.parse(call)
    binding.pry
  end


end

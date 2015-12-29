class PersonDatum < ActiveRecord::Base
  belongs_to :person

  before_save :set_up

  def set_up
    parsed_call       = JSON.parse(json_hash)
    self.state_pop = parsed_call[1][0]
    self.age_pop = nil
    self.gender_pop = parsed_call[1][1]
    self.gender_race_pop = parsed_call[1][2]
    self.gender_age_pop   = parsed_call[1][3]
    self.gender_age_and_race_pop = parsed_call[1][4]
  end

end

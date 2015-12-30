class PersonDataController < ApplicationController

  def index
    @person_data = PersonDatum.where(person: Person.where(user: current_user))

  end

end

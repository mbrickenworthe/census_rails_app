class PersonDataController < ApplicationController

  def index
    @person_data_written = PersonDatum.where(person: Person.where(user: current_user))
    @person_data_map_data = PersonDatum.where(person: Person.where(:user => [current_user, nil]))
    @key = MyApp.config.google_api_key
    @current_user_people = Person.where(:user => [current_user, nil])
    @google_hash = {}
    @circle_one = {}
    @circle_two = {}
    @circle_three = {}
    @circle_four = {}
    @current_user_person_object = Person.where(user: current_user, active_user: true).first
    @person_data_map_data.each do |personal_data|
      @google_hash[(personal_data.person.name)] = GoogleMapsInfoHelper.new(personal_data).final_hash
      @circle_one[(personal_data.person.name)] = GoogleMapsInfoHelper.new(personal_data).circle_hash_one
      @circle_two[(personal_data.person.name)] = GoogleMapsInfoHelper.new(personal_data).circle_hash_two
      @circle_three[(personal_data.person.name)] = GoogleMapsInfoHelper.new(personal_data).circle_hash_three
      @circle_four[(personal_data.person.name)] = GoogleMapsInfoHelper.new(personal_data).circle_hash_four
    end
  end

  def google_query
    @person_data_written = PersonDatum.where(person: Person.where(user: current_user))
    @person_data_map_data = PersonDatum.where(person: Person.where(:user => [current_user, nil]))
    @key = MyApp.config.google_api_key
    @current_user_people = Person.where(:user => [current_user, nil])
    @google_hash = {}
    @current_user_person_object = Person.where(user: current_user, active_user: true).first
    @person_data_map_data.each do |personal_data|
      @google_hash[(personal_data.person.name)] = GoogleMapsInfoHelper.new(personal_data).final_hash
    end
    @search = {}
    if params[:google_query] == nil
      @search[:query] = 'bar'
    end
    @search[:query] = [params[:google_query]]
    render 'index'
    puts "I'm in this query"
  end

end

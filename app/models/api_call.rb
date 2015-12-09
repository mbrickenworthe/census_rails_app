class APICall

  attr_reader :key, :api_front, :api_back, :total_string, :people_to_test

  def initialize
    @key = ENV['DEVELOPER_KEY']
    @api_front = 'http://api.census.gov/data/2010/sf1?key=82faf50f5c81576016ec20b3438d031173085c17&get=PCT0120001'
    @total_string = nil
    @people_to_test = []
  end

  def get_calls_data
    @people_to_test.each do |person|
      if person.sex == "M"
        person.api_data = create_api_call_male(person.age, person.race, person.state)
      else
        person.api_data = create_api_call_female(person.age, person.race, person.state)  
      end
    end
  end

  def api_back(state)
    back = "&for=state:#{state}"
  end

  def create_api_call_male(age, race, state)
    total_string = 
        api_front + 
        total_male_pop + 
        get_males_by_age(age) + 
        get_males_by_race(race) +
        get_males_by_age_and_race(age, race) + 
        api_back(state)
    @total_string = total_string
    make_api_call(total_string)
  end

  def add_another_state(state)
    if @total_string
      added_state_call = total_string + "," + state.to_s
      make_api_call(added_state_call)
    else
      puts "You have made the initial call!"
    end
  end

  def create_api_call_female(age, race, state)
    total_string = 
        api_front + 
        total_female_pop + 
        get_females_by_age(age) + 
        get_females_by_race(race) +
        get_females_by_age_and_race(age, race) + 
        api_back(state)
    @total_string = total_string
    make_api_call(total_string)
  end

  def make_api_call(api_call_info)
    call = RestClient.get(api_call_info)
    parsed_call = JSON.parse(call)
  end

  def total_male_pop
    male_api = ',PCT0120002'
  end

  def total_female_pop
    female_api = ',PCT0120106'
  end

  def get_males_by_age(age)
    males_age_api = ",PCT01200" + (3 + age).to_s
  end

  def get_females_by_age(age)
    females_age_api = ",PCT01201" + (7 + age).to_s
  end

  def get_males_by_race(race)
    males_race_api = ",PCT012#{race}002"
  end

  def get_females_by_race(race)
    females_race_api = ",PCT012#{race}106"
  end

  def get_males_by_age_and_race(age, race)
    male_race_and_age_api = ",PCT012#{race}0" + (3 + age).to_s
  end

  def get_females_by_age_and_race(age, race)
    female_race_and_age_api = ",PCT012#{race}1" + (7 + age).to_s
  end

end

class Person

  attr_accessor :name, :sex, :age, :race, :state, :api_data, :state_postal, :race_written

  STATES =   {  "AL" => 1, 
                "AK" => 2, 
                "AR" => 5, 
                "AZ" => 4, 
                "CA" => 6, 
                "CO" => 8, 
                "CT" => 9, 
                "DC" => 11, 
                "DE" => 10, 
                "FL" => 12, 
                "GA" => 13, 
                "HI" => 15, 
                "IA" => 19, 
                "ID" => 16, 
                "IL" => 17, 
                "IN" => 18, 
                "KS" => 20, 
                "KY" => 21, 
                "LA" => 22, 
                "MA" => 25, 
                "MD" => 24, 
                "ME" => 23, 
                "MI" => 26, 
                "MN" => 27, 
                "MO" => 29, 
                "MS" => 28, 
                "MT" => 30, 
                "NC" => 37, 
                "ND" => 38, 
                "NE" => 31, 
                "NH" => 33, 
                "NJ" => 34, 
                "NM" => 35, 
                "NV" => 32, 
                "NY" => 36, 
                "OH" => 39, 
                "OK" => 40, 
                "OR" => 41, 
                "PA" => 42, 
                "RI" => 44, 
                "SC" => 45, 
                "SD" => 46, 
                "TN" => 47, 
                "TX" => 48, 
                "UT" => 49, 
                "VA" => 51,
                "VT" => 50, 
                "WA" => 53, 
                "WI" => 55, 
                "WV" => 54, 
                "WY" => 56 
        }

    def initialize(name)
        @name = name
    end

    def race=(race)
        race = race.to_i
        if race == 1
            @race = "A"
            @race_written = "white"
        elsif race == 2
            @race = "B"
            @race_written = "black"
        elsif race == 3
            @race = "C"
            @race_written = "American Indian"
        elsif race == 4
            @race = "D"
            @race_written = "Asian"
        elsif race == 5
            @race = "E"
            @race_written = "Pacific Islander"
        elsif race == 6
            @race = "H"
            @race_written = "Hispanic/Latino"
        elsif race == 7
            @race = "F"
            @race_written = "another single race"
        else
            @race = "G"
            @race_written = "two or more races"
        end
    end

    def sex=(sex)
        @sex = sex.upcase
    end

    def age=(age)
        @age = age.to_i
    end

    def state=(state)
        state = state.upcase
        @state_postal = state
        @state = STATES[state]
    end

end
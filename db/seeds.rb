# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

states = State.create([
  {name: "Alabama", state_number: "01", state_abbr: "AL"}, 
  {name: "Alaska", state_number: "02", state_abbr: "AK"}, 
  {name: "Arizona", state_number: "04", state_abbr: "AZ"}, 
  {name: "Arkansas", state_number: '05', state_abbr: "AR"}, 
  {name: "California", state_number: '06', state_abbr: "CA"}, 
  {name: "Colorado", state_number: '08', state_abbr: "CO"}, 
  {name: "Connecticut", state_number: '09', state_abbr: "CT"}, 
  {name: "District of Columbia", state_number: '11', land_area: 61, state_abbr: "DC"}, 
  {name: "Delaware", state_number: '10', state_abbr: "DE"}, 
  {name: "Florida", state_number: '12', state_abbr: "FL"}, 
  {name: "Georgia", state_number: '13', state_abbr: "GA"}, 
  {name: "Hawaii", state_number: '15', state_abbr: "HI"}, 
  {name: "Idaho", state_number: '16', state_abbr: "ID"}, 
  {name: "Illinois", state_number: 17, state_abbr: "IL"}, 
  {name: "Indiana", state_number: 18, state_abbr: "IN"}, 
  {name: "Iowa", state_number: '19', state_abbr: "IA"}, 
  {name: "Kansas", state_number: '20', state_abbr: "KS"}, 
  {name: "Kentucky", state_number: '21', state_abbr: "KY"}, 
  {name: "Louisiana", state_number: 22, state_abbr: "LA"}, 
  {name: "Maine", state_number: 23, state_abbr: "ME"}, 
  {name: "Maryland", state_number: '24', state_abbr: "MD"}, 
  {name: "Massachusetts", state_number: '25', state_abbr: "MA"}, 
  {name: "Michigan", state_number: '26', state_abbr: "MI"}, 
  {name: "Minnesota", state_number: '27', state_abbr: "MN"}, 
  {name: "Mississippi", state_number: '28', state_abbr: "MS"}, 
  {name: "Missouri", state_number: '29', state_abbr: "MO"}, 
  {name: "Montana", state_number: '30', state_abbr: "MT"}, 
  {name: "Nebraska", state_number: '31', state_abbr: "NE"}, 
  {name: "Nevada", state_number: '32', state_abbr: "NV"}, 
  {name: "North Carolina", state_number: '37', state_abbr: "NC"}, 
  {name: "North Dakota", state_number: '38', state_abbr: "ND"}, 
  {name: "New Hampshire", state_number: '33', state_abbr: "NH"}, 
  {name: "New Jersey", state_number: '34', state_abbr: "NJ"}, 
  {name: "New Mexico", state_number: '35', state_abbr: "NM"}, 
  {name: "New York", state_number: '36', state_abbr: "NY"}, 
  {name: "Ohio", state_number: '39', state_abbr: "OH"}, 
  {name: "Oklahoma", state_number: '40', state_abbr: "OK"}, 
  {name: "Oregon", state_number: '41', state_abbr: "OR"}, 
  {name: "Pennsylvania", state_number: '42', state_abbr: "PA"}, 
  {name: "Rhode Island", state_number: '44', state_abbr: "RI"}, 
  {name: "South Carolina", state_number: '45', state_abbr: "SC"}, 
  {name: "South Dakota", state_number: '46', state_abbr: "SD"}, 
  {name: "Tennessee", state_number: '47', state_abbr: "TN"}, 
  {name: "Texas", state_number: '48', state_abbr: "TX"}, 
  {name: "Utah", state_number: '49', state_abbr: "UT"}, 
  {name: "Virginia", state_number: '51', state_abbr: "VA"}, 
  {name: "Vermont", state_number: '50', state_abbr: "VT"}, 
  {name: "Washington", state_number: '53', state_abbr: "WA"}, 
  {name: "Wisconsin", state_number: '55', state_abbr: "WI"}, 
  {name: "West Virginia", state_number: '54', state_abbr: "WV"}, 
  {name: "Wyoming", state_number: '56', state_abbr: "WY"}])

races = Race.create([{name: "white", race_letter: "A"}, {name: "black", race_letter: "B"}, {name: "American Indian", race_letter: "C"}, {name: "Asian", race_letter: "D"}, {name: "Pacific Islander", race_letter: "E"}, {name: "Hispanic/Latino", race_letter: "H"}, {name: "another race", race_letter: "F"}, {name: "two or more races", race_letter: "G"}])

user = User.create(name: "Admin", email: "a@a.a", password: "Password12", password_confirmation: "Password12")
aziz_photo = File.open('db/seed_pictures/aziz_pic.jpg')
aziz = Person.create(name: "Aziz", age: 32, race: Race.find_by(name: "Asian"), male: true, active_user: false, state: State.find_by(name: "South Carolina"), user: nil, city: "Charleston", photo: aziz_photo)

michele_photo = File.open('db/seed_pictures/michele_pic.jpg')
michele = Person.create(name: "Michele", age: 59, race: Race.find_by(name: "white"), male: false, active_user: false, state: State.find_by(name: "Minnesota"), user: nil, city: "St. Cloud", photo: michele_photo)


census = CensusCall.new(michele)
PersonDatum.create(json_hash: census.call_data, person: michele)
census2 = CensusCall.new(aziz)
PersonDatum.create(json_hash: census2.call_data, person: aziz)

# These lines of code are using Nokogiri to add the land_area to each of the states cause I didn't want to do it by hand.

def make_noko_giri_parse
  page = Nokogiri::HTML(RestClient.get("http://www.theus50.com/fastfacts/area.php"))
  state_info = page.css('td')
end

def fill_in_state_land_area
  state_info = make_noko_giri_parse
  i = 0
  while i < 150 do
    state = State.find_by(name: state_info[i].text)
    if state != nil
      state.update_attributes(land_area: state_info[(i + 1)].text.gsub(",", "").to_i)
    else
    end
    i += 1
  end  
end

def get_birth_names
  states = State.all

  Dir.chdir(File.dirname("/Users/awinters/Downloads/namesbystate/AK.TXT"))
  states.each do |state|
    file = File.open("/Users/awinters/Downloads/namesbystate/#{state.state_abbr}.TXT")
    file.each_line do |line|
     split_line = line.split(",")
      birth_data = StateBirthName.create(year: split_line[2].to_i, name: split_line[3], frequency: split_line[4].to_i, state: state, sex: split_line[1])
    end
  end
end

get_birth_names
fill_in_state_land_area

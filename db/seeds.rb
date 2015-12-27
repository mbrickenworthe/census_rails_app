# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  states = State.create([{name: "Alabama", state_number: 1}, {name: "Alaska", state_number: 2}, {name: "Arizona", state_number: 4}, {name: "Arkansas", state_number: 5}, {name: "California", state_number: 6}, {name: "Connecticut", state_number: 9}, {name: "Colorado", state_number: 8}, {name: "District of Columbia", state_number: 11}, {name: "Delaware", state_number: 10}, {name: "Florida", state_number: 12}, {name: "Georgia", state_number: 13}, {name: "Hawaii", state_number: 15}, {name: "Idaho", state_number: 16}, {name: "Illinois", state_number: 17}, {name: "Indiana", state_number: 18}, {name: "Iowa", state_number: 19}, {name: "Kansas", state_number: 20}, {name: "Kentucky", state_number: 21}, {name: "Louisiana", state_number: 22}, {name: "Maine", state_number: 23}, {name: "Maryland", state_number: 24}, {name: "Massachusetts", state_number: 25}, {name: "Michigan", state_number: 26}, {name: "Minnesota", state_number: 27}, {name: "Mississippi", state_number: 28}, {name: "Missouri", state_number: 29}, {name: "Montana", state_number: 30}, {name: "Nebraska", state_number: 31}, {name: "Nevada", state_number: 32}, {name: "North Carolina", state_number: 37}, {name: "North Dakota", state_number: 38}, {name: "New Hampshire", state_number: 33}, {name: "New Jersey", state_number: 34}, {name: "New Mexico", state_number: 35}, {name: "New York", state_number: 36}, {name: "Ohio", state_number: 39}, {name: "Oklahoma", state_number: 40}, {name: "Oregon", state_number: 41}, {name: "Pennsylvania", state_number: 42}, {name: "Rhode Island", state_number: 44}, {name: "South Carolina", state_number: 45}, {name: "South Dakota", state_number: 46}, {name: "Tennessee", state_number: 47}, {name: "Texas", state_number: 48}, {name: "Utah", state_number: 49}, {name: "Virginia", state_number: 51}, {name: "Vermont", state_number: 50}, {name: "Washington", state_number: 53}, {name: "Wisconsin", state_number: 55}, {name: "West Virginia", state_number:54}, {name: "Wyoming", state_number: 56}])

admin = User.create(name: "Admin", email: "a@a.a", password: "Password12", password_confirmation: "Password12")

aziz = Person.create(name: "Aziz", age: 32, race_number: "E", race: "Indian/Asian", male: true, female: false, active_user: false, state: State.find_by(name: "South Carolina"), user: User.find_by(name: "Adam W"))

sarah = Person.create(name: "Sarah", age: 51, race_number: "A", race: "White", male: false, female: true, active_user: false, state: State.find_by(name: "Alaska"), user: User.find_by(name: "Adam W"))


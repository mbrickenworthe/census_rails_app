# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


task seed_birth_name_info: :environment do
  states = State.all.order(:name)
  Dir.chdir(File.dirname("/Users/awinters/Downloads/namesbystate/AK.TXT"))
  states.each do |state| 
    StateBirthName.transaction do
      state_birth_names = []
      time1 = Time.now
      file = File.open("/Users/awinters/Downloads/namesbystate/#{state.state_abbr}.TXT")
      file.each_line do |line|
        split_line = line.split(",")
        state_birth_names << StateBirthName.new(year: split_line[2].to_i, name: split_line[3], frequency: split_line[4].to_i, sex: split_line[1], state: state)
      end
      time2 = Time.now
      StateBirthName.import state_birth_names
      puts "#{state.name} done. Took #{(time2 - time1).round(1)} sec"
    end
  end
end
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


task seed_birth_name_info: :environment do
  states = State.all.order(:name)
  Dir.chdir(File.dirname("/Users/awinters/Downloads/namesbystate/AK.TXT"))
  states.each do |state| 
    StateBirthName.transaction do
      state_file = CSV.read("/Users/awinters/Downloads/namesbystate/#{state.state_abbr}.TXT")
      columns = [:state_abbr, :sex, :year, :name, :frequency]
      StateBirthName.import columns, state_file, validate: false
      puts "#{state.name} done."
    end
  end
end
class State < ActiveRecord::Base
  has_many :people
  has_many :state_birth_names
end

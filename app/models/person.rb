class Person < ActiveRecord::Base
  has_many :posts
  belongs_to :state
end

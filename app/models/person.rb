class Person < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  belongs_to :state
  belongs_to :race

  geocoded_by :address_string
  after_validation :geocode

  def address_string
    "#{self.city}, #{self.state.name}"
  end

  def sex
    if male
      "Male"
    else
      "Female"
    end
  end

end

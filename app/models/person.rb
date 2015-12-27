class Person < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  belongs_to :state
  belongs_to :race

  def sex
    if male
      "Male"
    else
      "Female"
    end
  end

end

class Person < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  belongs_to :state
  belongs_to :race
  belongs_to :cencus_call

  def sex
    if male
      "Male"
    else
      "Female"
    end
  end

end

class StateBirthName < ActiveRecord::Base

  belongs_to :state

  def save_in_one_big_push!(options = {})
    save! options
  end

end

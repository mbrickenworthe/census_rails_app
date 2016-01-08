class Person < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  belongs_to :state
  belongs_to :race

  has_attached_file :photo, styles: {
                              thumb: '32x32>',
                              square: '100x100#',
                              medium: '300x300>'
                            }
 validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

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
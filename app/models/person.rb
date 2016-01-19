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

 validates_presence_of :name, :age, :city
 validates :name, length: {minimum: 2}
 validates :city, length: {minimum: 3}
 validates :age, numericality: {greater_than_or_equal_to: 5, less_than: 110 }

  geocoded_by :address_string
  after_validation :geocode
  after_create :add_default_pic, :person_year, :age_in_2010

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

  def add_default_pic
    @photo ||= File.open('public/assets/photos/default.jpg')
    self.photo_file_name == nil ? self.update_attributes(photo: @photo) : self.photo
  end

  def person_year
    self.update_attributes(birth_year: (Time.now.year - (self.age + 1)))
  end

  def age_in_2010
    self.update_attributes(age_2010: (self.age - 5))
  end

end
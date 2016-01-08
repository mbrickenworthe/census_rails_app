class PeopleController < ApplicationController

before_action :authenticate_user!, except: [:famous_new, :create]

  def new
    if created_first_admin
      @person = Person.new(name: current_user.name)
      @text = "Create Your Profile Info"
      @name = "Your Name"
    else
      @person = Person.new(user: current_user)
      @text = "Create A Family Member"
      @name = "Your Family Member's Name"
    end
    @famous = false
  end

  def famous_new
    @person = Person.new
    @text = "Create A Famous Person!"
    @name = "Famous Person's Name"
    @famous = true
  end

  def create
    @person = Person.new
    if person_params[:male] == "false"
      sex = false
    else
      sex = true
    end
    if @person.update_attributes(person_params) && @person.update_attributes(male: sex, active_user: created_first_admin, user: current_user)
      if params[:person][:famous] == "true"
        @person.update_attributes(user: nil)
      end
      cencus = CencusCall.new(@person)
      PersonDatum.create(json_hash: cencus.call_data, person: @person)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @people = Person.where(user: current_user)
  end

  private

  def person_params
    params.require(:person).permit(:name, :male, :age, :state_id, :race_id, :city, :photo)
  end

end

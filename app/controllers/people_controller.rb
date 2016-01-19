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
    person_params[:male] == "false" ? sex = false : sex =true
    if @person.update_attributes(person_params) && @person.update_attributes(male: sex, active_user: created_first_admin, user: current_user)
      if params[:person][:famous] == "true"
        @person.update_attributes(user: nil)
      end
      census = CensusCall.new(@person)
      PersonDatum.create(json_hash: census.call_data, person: @person)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @people = Person.where(user: current_user)
    @delete_image = "/assets/photos/delete_icon.png"
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      PersonDatum.find_by(person: @person).update_uniqueness_data.save
      redirect_to person_data_path
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    PersonDatum.find_by(person: @person).destroy
    @person.destroy
    redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:name, :male, :age, :state_id, :race_id, :city, :photo)
  end

end

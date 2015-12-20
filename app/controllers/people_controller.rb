class PeopleController < ApplicationController

  def new
    @person = Person.new
    @states = State.all
  end

  def create
    binding.pry
  end

  def index
    @people = Person.where(user: User.first)
  end

  private

  def person_params
    params.require(:person).permit(:name, :age, :male, :state)
  end

end

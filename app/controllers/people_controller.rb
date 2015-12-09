class PeopleController < ApplicationController

  def new
    @person = Person.new
    @states = State.all
  end

  def create
    binding.pry
  end

end

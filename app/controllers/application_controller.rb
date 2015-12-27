class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :create_first_user_data, :created_entry

  attr_accessor :created_entry

  def initialize
    @created_entry = false
  end

  def change_entry
    @created_entry = true
  end

  def create_first_user_data
    redirect_to new_person_path
    change_entry
  end

  def logged_in?
    current_user != nil
  end

end

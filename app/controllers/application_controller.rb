class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :create_first_user_data, :created_entry, :created_first_admin

  attr_accessor :created_entry

  def created_first_admin
    if signed_in?
      if Person.where(user_id: current_user.id).count < 1
        true
      else
        false
      end
    else
      false
    end
  end

  def created_entry
    if signed_in?
      Person.where(user_id: current_user.id).empty?
    else
      false
    end
  end

  def create_first_user_data
    redirect_to new_person_path
  end

  def logged_in?
    current_user != nil
  end


end

class AboutController < ApplicationController

  def index
    @key = MyApp.config.google_api_key
  end

end

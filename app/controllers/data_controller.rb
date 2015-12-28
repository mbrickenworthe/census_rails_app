class DataController < ApplicationController

  def make_api_call(api_call_info)
    call = RestClient.get(api_call_info)
    parsed_call = JSON.parse(call)
  end

  back = "&for=state:#{state}"



end

class HomeController < ApplicationController

  def index
    render text: 'Enter desired address after "address=" on geocode url'
  end

  def geocode
    if params[:search].present?
      @locations = Geocoder.search(params[:search].split('=').last)
    end
  end
end

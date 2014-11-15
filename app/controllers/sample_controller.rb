class SampleController < ApplicationController
  def index
    station ='odpt.Station:TokyoMetro.Chiyoda.Hibiya'
    railway = 'odpt.Railway:TokyoMetro.Chiyoda'
    @results = Tokyometro.find_train_location_by_station_and_railway(station, railway)
  end
end

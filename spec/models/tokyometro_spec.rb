require 'rails_helper'

RSpec.describe Tokyometro, :type => :model do
  describe 'find_train_location_by_station_and_railway method' do
    context 'vcr sample' do
      it {
        VCR.use_cassette 'model/api_response' do
          station ='odpt.Station:TokyoMetro.Chiyoda.Otemachi'
          railway = 'odpt.Railway:TokyoMetro.Chiyoda'
          response = Tokyometro.find_train_location_by_station_and_railway(station, railway)
          expect(response[0]['dc:date']).to eq '2014-11-15T16:42:23+09:00'
        end
      }
    end
  end
end

class Tokyometro
  API_ENDPOINT   = 'https://api.tokyometroapp.jp/api/v2/'

  def self.find_train_location_by_station_and_railway(station, railway)
    params = {
      'rdf:type'         => 'odpt:Train',
      'odpt:railway'     => railway,
      'odpt:fromStation' => station
    }

    locations = call_api('datapoints', params)
    locations
  end

  def self.call_api(category, params = {})
    params['acl:consumerKey'] = ENV['TOKYOMETRO_ACCESS_TOKEN']
    url = API_ENDPOINT + category
    results = RestClient.get(url, params: params)
    results = results.body.blank? ? nil : JSON.parse(results.body)
    results
  end
end
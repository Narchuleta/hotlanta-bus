module LocationsHelper
  def fetch_buses_from_api(bus_api_url)
    raw_http = Net::HTTP.get_response(URI.parse(bus_api_url))
    bus_data = raw_http.body
    
    JSON.parse(bus_data)
  end
  def is_nearby?(user_latitude, user_longitude, bus_latitude, bus_longitude)
    max_distance = 0.01 #about 1/2 mile
    
    difference_latitudes = user_latitude - bus_latitude.to_f
    difference_longitudes = user_longitude - bus_longitude.to_f
    
    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)
    
    distance <= max_distance
  end

end

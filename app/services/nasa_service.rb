class NasaService

  def days(start_date, end_date)
    get_json("/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}")[:near_earth_objects]
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nasa.gov/") do |f|
      f.params['api_key'] = ENV['NASA_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

end

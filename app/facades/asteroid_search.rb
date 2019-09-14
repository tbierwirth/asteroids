class AsteroidSearch
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def dangerous_days
    service = NasaService.new
    service.days(@start_date, @end_date).transform_values do |day|
      day.find_all { |v| v[:is_potentially_hazardous_asteroid] }
    end
  end

  def asteroids
    danger = dangerous_days.max_by do |day|
      day[1].length
    end

    danger[1].map do |asteroid|
      Asteroid.new(asteroid[:name], asteroid[:neo_reference_id])
    end
  end

  def most_dangerous_day
    dangerous_days.max_by do |day|
      day[1].length
    end[0].to_s.to_date.strftime("%B %d, %Y")
  end

end

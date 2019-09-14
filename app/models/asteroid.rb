class Asteroid
  attr_reader :name, :neo_reference_id

  def initialize(name, neo_reference_id)
    @name = name
    @neo_reference_id = neo_reference_id
  end
end

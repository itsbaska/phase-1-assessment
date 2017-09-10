require_relative 'terrain_helper'

class CityMap
  attr_reader :terrain_helper
  attr_reader :terrain_list
  attr_reader :size

  def initialize(args={})
    @terrain_list = args[:terrain_list]
    @terrain_helper = args.fetch(:terrain_helper, TerrainHelper.new)
    @size = args[:size]
  end

  def terrain_map
    terrain_map = terrain_list.dup
    terrain_map.map! {|letter| terrain_helper.letter_to_terrain(letter)}
    terrain_map.each_slice(size).to_a
  end

  def time_estimate_for_journey(journey)
    journey_terrain = []
    journey.each do | coordinate|
      journey_terrain << terrain_map[coordinate[0]][coordinate[1]]
    end
    
    total_time = 0
    journey_terrain.each do |terrain|
      total_time += terrain_helper.time_estimate_for_terrain(terrain)
    end
    total_time
  end
end

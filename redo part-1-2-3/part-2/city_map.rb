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
    terrain_map = terrain_list.map {|letter| terrain_helper.letter_to_terrain(letter)}.each_slice(self.size).to_a
  end

  def time_estimate_for_journey(journey)
    time = []
    journey.each do |coordinate|
      time << terrain_helper.time_estimate_for_terrain(terrain_map[coordinate[0]][coordinate[1]])
    end
      time.reduce(0) {|total_time, time| total_time + time}
  end
end

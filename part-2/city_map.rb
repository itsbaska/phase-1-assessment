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
end

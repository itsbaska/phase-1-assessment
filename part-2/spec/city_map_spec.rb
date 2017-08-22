require_relative "spec_helper"

describe CityMap do
  let(:my_helper)  { TerrainHelper.new }

  let(:my_terrain_list) do
    ["F","F","M","S","F","T","S","M","F"]
  end

  let(:map_size) { 3 }

  let(:city_map) do
    CityMap.new(terrain_helper: my_helper, terrain_list: my_terrain_list, size: map_size)
  end

  it "has a helper" do
    expect(city_map.terrain_helper).to be_a(TerrainHelper)
  end

  it "has a terrain list" do
    expect(city_map.terrain_list).to eq(my_terrain_list)
  end

  it "has a size" do
    expect(city_map.size).to eq(map_size)
  end

  describe "#terrain_map", {terrain_map: true} do
    it "yields a 2D map of the terrain" do
      expect(city_map.terrain_map)
        .to eq([
                [:flat,  :flat,  :moderate],
                [:steep, :flat, :track],
                [:steep,   :moderate,   :flat]
               ])
    end

    it "responds to map size" do
      small_size = 2
      short_terrain_list = ["S","F","M","T"]
      small_map = CityMap.new(terrain_list: short_terrain_list, size: small_size, terrain_helper: my_helper)

      expect(small_map.terrain_map)
        .to eq([
                [:steep,  :flat],
                [:moderate, :track]
               ])
    end
  end

  describe "#time_estimate_for_journey", {time_estimate: true} do
    it "totals the time_estimate of a journey" do
      journey = [[0,0], [0,1], [1,1], [1,2], [2,2]]
      expect(city_map.time_estimate_for_journey(journey)).to eq(45)
    end
  end
end

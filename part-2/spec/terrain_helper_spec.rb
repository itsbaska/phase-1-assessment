require_relative "spec_helper"

describe TerrainHelper do
  let(:helper) { TerrainHelper.new }

  describe "time estimate" do
    it "estimates travel time for terrain" do
      expect(helper.time_estimate_for_terrain(:steep)).to eq(30)
      expect(helper.time_estimate_for_terrain(:track)).to eq(5)
    end

    it "raises an exception if it can't recognize the terrain" do
      expect{helper.time_estimate_for_terrain(:lava)}
        .to raise_error("I can't recognize this terrain type: :lava (must be :track, :flat, :moderate, or :steep)")
    end
  end

  describe "converting letters to terrain" do
    it "converts a letter to a terrain symbol" do
      expect(helper.letter_to_terrain("T")).to eq(:track)
      expect(helper.letter_to_terrain("S")).to eq(:steep)
    end

    it "raises an exception if it can't recognize the terrain" do
      expect{helper.letter_to_terrain("L")}
        .to raise_error("I can't recognize this terrain letter: \"L\" (must be 'T', 'F', 'M' or 'S')")
    end
  end
end

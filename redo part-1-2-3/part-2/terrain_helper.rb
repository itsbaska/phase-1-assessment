class TerrainHelper
  def time_estimate_for_terrain(terrain_type)
    case terrain_type
    when :track
      5
    when :flat
      10
    when :moderate
      20
    when :steep
      30
    else
      raise "I can't recognize this terrain type: #{terrain_type.inspect} (must be :track, :flat, :moderate, or :steep)"
    end
  end

  def letter_to_terrain(terrain_letter)
    case terrain_letter
    when "T"
      :track
    when "F"
      :flat
    when "M"
      :moderate
    when "S"
      :steep
    else
      raise "I can't recognize this terrain letter: #{terrain_letter.inspect} (must be 'T', 'F', 'M' or 'S')"
    end
  end
end

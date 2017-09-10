class Director
  attr_reader :name, :directed_shows
  attr_writer :awards, :award_nominations

  include Awarder
  
  def initialize(args = {})
    @name = args[:name]
    @directed_shows = args.fetch(:directed_shows, [])
  end
end

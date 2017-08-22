class Director
  attr_reader :name, :directed_shows
  attr_writer :awards, :award_nominations

  def initialize(args = {})
    @name = args[:name]
    @directed_shows = args.fetch(:directed_shows, [])
  end

  def awards
    @awards ||= []
  end

  def award_nominations
    @award_nominations ||= []
  end

  def receive_award_nomination(award)
    award_nominations << award
  end

  def receive_award(award)
    awards << award
  end
end

class LeadActor
  attr_reader :name, :roles
  attr_writer :awards, :award_nominations

  def initialize(args = {})
    @name = args[:name]
    @roles = args.fetch(:roles, [])
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

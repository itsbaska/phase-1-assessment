module Awardable
  attr_writer :awards, :award_nominations

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

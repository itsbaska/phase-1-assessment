class StageMusical
  attr_reader :title, :director, :composer, :cast
  attr_writer :tickets, :awards, :award_nominations

  def initialize(args = {})
    @title = args[:title]
    @director = args[:director]
    @composer = args[:composer]
    @cast = args.fetch(:cast, [])
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

  def tickets
    @tickets ||= []
  end

  def take_ticket
    tickets.pop
  end

  def tickets_left
    tickets.length
  end

  def sold_out?
    tickets.empty?
  end
end

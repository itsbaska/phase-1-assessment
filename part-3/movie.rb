class Movie
  attr_reader :title, :director, :cast
  attr_writer :tickets, :award_nominations, :awards

  def initialize(args = {})
    @title = args[:title]
    @director = args[:director]
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

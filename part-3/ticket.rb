class Ticket
  attr_reader :cost, :time

  def initialize(args = {})
    @cost = args[:cost]
    @time = args[:time]
  end
end

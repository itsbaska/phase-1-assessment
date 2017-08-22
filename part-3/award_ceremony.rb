class AwardCeremony
  attr_reader :name, :event_date
  attr_writer :tickets

  def initialize(args = {})
    @name = args[:name]
    @event_date = args[:event_date]
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

module Ticketable
  attr_writer :tickets

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

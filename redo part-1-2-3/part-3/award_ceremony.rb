require_relative './modules/module_helper'

class AwardCeremony
  attr_reader :name, :event_date
  attr_writer :tickets

  include Ticketable

  def initialize(args = {})
    @name = args[:name]
    @event_date = args[:event_date]
  end

end

require_relative './modules/module_helper'

class AwardCeremony
  include Ticketable

  attr_reader :name, :event_date
  attr_writer :tickets


  def initialize(args = {})
    @name = args[:name]
    @event_date = args[:event_date]
  end
end

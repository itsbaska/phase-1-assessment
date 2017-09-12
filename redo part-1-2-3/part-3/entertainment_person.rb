require_relative './modules/module_helper'

class EntertainmentPerson
  attr_reader :name
  attr_writer :awards, :award_nominations

  include Awardable

  def initialize(args = {})
    @name = args[:name]
  end

end
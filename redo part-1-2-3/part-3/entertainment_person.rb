require_relative './modules/module_helper'

class EntertainmentPerson
  include Awardable
  attr_reader :name

  def initialize(args = {})
    @name = args[:name]
  end
end

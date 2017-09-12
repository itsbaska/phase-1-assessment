require_relative './modules/module_helper'

class Show
  attr_reader :title, :director, :cast
  attr_writer :tickets, :award_nominations, :awards
  
  include Awardable
  include Ticketable

  def initialize(args = {})
    @title = args[:title]
    @director = args[:director]
    @cast = args.fetch(:cast, [])
  end

end
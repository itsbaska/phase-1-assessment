require_relative './modules/module_helper'

class Show
  include Awardable
  include Ticketable

  attr_reader :title, :director, :cast

  def initialize(args = {})
    @title = args[:title]
    @director = args[:director]
    @cast = args.fetch(:cast, [])
  end
end

class LeadActor
  attr_reader :name, :roles
  attr_writer :awards, :award_nominations

  include Awarder

  def initialize(args = {})
    @name = args[:name]
    @roles = args.fetch(:roles, [])
  end

end

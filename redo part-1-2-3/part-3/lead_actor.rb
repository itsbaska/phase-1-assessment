class LeadActor < EntertainmentPerson
  attr_reader :roles

  def initialize(args = {})
    super
    @roles = args.fetch(:roles, [])
  end

end

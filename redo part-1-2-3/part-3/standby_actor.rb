# A standby is an actor who knows a lead part and is
# available to play the part if the lead is unable to perform (for live shows).

class StandbyActor < EntertainmentPerson
  attr_reader :roles, :prepared_for_roles

  def initialize(args = {})
    super
    @roles = args.fetch(:roles, [])
    @prepared_for_roles = args.fetch(:prepared_for_roles, [])
  end
end

# A standby is an actor who knows a lead part and is
# available to play the part if the lead is unable to perform (for live shows).

class StandbyActor < LeadActor
  attr_reader :prepared_for_roles

  def initialize(args = {})
    super
    @prepared_for_roles = args.fetch(:prepared_for_roles, [])
  end
end

class Director < EntertainmentPerson
  attr_reader :directed_shows

  def initialize(args = {})
    super
    @directed_shows = args.fetch(:directed_shows, [])
  end
end

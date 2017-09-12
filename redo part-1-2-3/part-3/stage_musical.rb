class StageMusical < Show
  attr_reader :composer

  def initialize(args = {})
    super
    @composer = args[:composer]
  end
end

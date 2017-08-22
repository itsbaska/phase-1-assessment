class Actor

  attr_reader :name, :popularity_rating, :salary

  def initialize(args = {})
    @name = args[:name]
    @popularity_rating = args[:popularity_rating]
    @salary = args[:salary]
  end
end

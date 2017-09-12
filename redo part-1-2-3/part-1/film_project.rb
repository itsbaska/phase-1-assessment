class FilmProject
  attr_accessor :title, :director
  attr_reader :cast, :casting_budget
  def initialize(args = {})
    @title = args[:title]
    @director = args[:director]
    @cast = args[:cast] || []
    @casting_budget = args[:casting_budget]
  end

  def remaining_budget
    cast_salary_total = cast.reduce(0) {|budget, actor| budget + actor.salary}
    casting_budget - cast_salary_total
  end

  def add_actor(actor)
    if remaining_budget >= actor.salary
      cast << actor
      return true
    end
    false
  end

  def headliners
    cast.select {|actor| actor.popularity_rating > 8}
  end

end

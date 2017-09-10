class FilmProject
  attr_reader :cast, :casting_budget
  attr_accessor :title, :director
  def initialize(args = {})
    @title = args[:title]
    @director = args[:director]
    @cast = args[:cast]
    @casting_budget = args[:casting_budget]
  end

  def remaining_budget
    cast_salary_total = 0
    cast.each { |actor| cast_salary_total += actor.salary }
    casting_budget - cast_salary_total
  end

  def add_actor(actor)
    if actor.salary <= remaining_budget
      cast << actor
      return true
    end
    false
  end

  def headliners
    cast.select {|actor| actor.popularity_rating > 8}
  end

end

class Award
  attr_reader :category, :type, :year

  def initialize(args = {})
    @category = args[:category]
    @type = args[:type]
    @year = args[:year]
  end

  def name
    "#{year} #{type} for #{category}"
  end
end

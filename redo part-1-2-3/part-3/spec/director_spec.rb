require_relative "spec_helper"

describe Director do
  let(:director) { Director.new(name: "Martin Scorsese") }

  it "has a name" do
    expect(director.name).to eq "Martin Scorsese"
  end

  it "defaults to having no directed shows" do
    expect(director.directed_shows).to eq []
  end

  it "can be instantiated with directed shows" do
    show = Movie.new
    director = Director.new(directed_shows: [show])

    expect(director.directed_shows).to match_array [show]
  end

  describe "being nominated for and winning awards" do
    it "defaults to having no award_nominations" do
      expect(director.award_nominations).to eq []
    end

    it "can be assigned award nominations" do
      nominations = [Award.new]
      director.award_nominations = nominations

      expect(director.award_nominations).to match_array nominations
    end

    it "can receive a nomination" do
      award = Award.new

      expect(director.award_nominations).to_not include award
      director.receive_award_nomination(award)
      expect(director.award_nominations).to include award
    end

    it "defaults to having no awards" do
      expect(director.awards).to eq []
    end

    it "can be assigned awards" do
      awards = [Award.new]
      director.awards = awards

      expect(director.awards).to match_array awards
    end

    it "can receive an award" do
      award = Award.new

      expect(director.awards).to_not include award
      director.receive_award(award)
      expect(director.awards).to include award
    end
  end
end

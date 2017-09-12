require_relative "spec_helper"

describe Movie do
  let (:movie) do
    Movie.new({
      :title    => "Stardust"
    })
  end

  it "has a title" do
    expect(movie.title).to eq "Stardust"
  end

  it "has a director" do
    director = Director.new
    movie = Movie.new(director: director)

    expect(movie.director).to eq director
  end

  it "defaults to having an empty cast" do
    expect(movie.cast).to eq []
  end

  it "can be instantiated with a cast" do
    actor = LeadActor.new
    movie = Movie.new(cast: [actor])

    expect(movie.cast).to match_array [actor]
  end

  describe "being nominated for and winning awards" do
    it "defaults to having no award_nominations" do
      expect(movie.award_nominations).to eq []
    end

    it "can be assigned award nominations" do
      nominations = [Award.new]
      movie.award_nominations = nominations

      expect(movie.award_nominations).to match_array nominations
    end

    it "can receive a nomination" do
      award = Award.new

      expect(movie.award_nominations).to_not include award
      movie.receive_award_nomination(award)
      expect(movie.award_nominations).to include award
    end

    it "defaults to having no awards" do
      expect(movie.awards).to eq []
    end

    it "can be assigned awards" do
      awards = [Award.new]
      movie.awards = awards

      expect(movie.awards).to match_array awards
    end

    it "can receive an award" do
      award = Award.new

      expect(movie.awards).to_not include award
      movie.receive_award(award)
      expect(movie.awards).to include award
    end
  end

  describe "having tickets" do
    let(:movie_tickets) do
      [Ticket.new(cost:10, time:"7:00pm"),
       Ticket.new(cost:10, time:"7:00pm")]
    end

    let(:movie_with_tickets) do
      movie.tickets = movie_tickets
      movie
    end

    it "defaults to having no tickets" do
      expect(movie.tickets).to eq []
    end

    it "can be assigned tickets" do
      movie.tickets = movie_tickets
      expect(movie.tickets).to eq(movie_tickets)
    end

    it "allows tickets to be taken" do
      expect(movie_with_tickets.take_ticket).to be_a(Ticket)
    end

    it "reports the tickets left" do
      expect(movie_with_tickets.tickets_left).to eq(2)
    end

    it "can tell if it's sold out" do
      expect(movie_with_tickets.sold_out?).to be(false)
      movie_with_tickets.take_ticket
      movie_with_tickets.take_ticket
      expect(movie_with_tickets.sold_out?).to be(true)
    end
  end
end

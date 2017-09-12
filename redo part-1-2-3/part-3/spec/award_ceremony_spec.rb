require_relative "spec_helper"

describe AwardCeremony do
  let (:ceremony) { AwardCeremony.new(name: "Oscars", event_date: "02-02-2017") }

  it "has a name" do
    expect(ceremony.name).to eq "Oscars"
  end

  it "has an event date" do
    expect(ceremony.event_date).to eq "02-02-2017"
  end

  describe "having tickets" do
    let(:ceremony_tickets) do
      [Ticket.new(cost:10, time:"7:00pm"),
       Ticket.new(cost:10, time:"7:00pm")]
    end

    let(:ceremony_with_tickets) do
      ceremony.tickets = ceremony_tickets
      ceremony
    end

    it "defaults to having no tickets" do
      expect(ceremony.tickets).to eq []
    end

    it "can be assigned tickets" do
      ceremony.tickets = ceremony_tickets
      expect(ceremony.tickets).to eq(ceremony_tickets)
    end

    it "allows tickets to be taken" do
      expect(ceremony_with_tickets.take_ticket).to be_a(Ticket)
    end

    it "reports the tickets left" do
      expect(ceremony_with_tickets.tickets_left).to eq(2)
    end

    it "can tell if it's sold out" do
      expect(ceremony_with_tickets.sold_out?).to be(false)
      ceremony_with_tickets.take_ticket
      ceremony_with_tickets.take_ticket
      expect(ceremony_with_tickets.sold_out?).to be(true)
    end
  end
end

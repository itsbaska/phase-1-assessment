require_relative "spec_helper"

describe LeadActor do
  let (:actor) { LeadActor.new(name: "Idina Menzel") }

  it "has a name" do
    expect(actor.name).to eq "Idina Menzel"
  end

  it "defaults to having no roles" do
    expect(actor.roles).to eq []
  end

  it "can be instantiated with roles" do
    role = "Maureen Johnson"
    actor = LeadActor.new(roles: [role])

    expect(actor.roles).to match_array [role]
  end

  describe "being nominated for and winning awards" do
    it "defaults to having no award_nominations" do
      expect(actor.award_nominations).to eq []
    end

    it "can be assigned award nominations" do
      nominations = [Award.new]
      actor.award_nominations = nominations

      expect(actor.award_nominations).to match_array nominations
    end

    it "can receive a nomination" do
      award = Award.new

      expect(actor.award_nominations).to_not include award
      actor.receive_award_nomination(award)
      expect(actor.award_nominations).to include award
    end

    it "defaults to having no awards" do
      expect(actor.awards).to eq []
    end

    it "can be assigned awards" do
      awards = [Award.new]
      actor.awards = awards

      expect(actor.awards).to match_array awards
    end

    it "can receive an award" do
      award = Award.new

      expect(actor.awards).to_not include award
      actor.receive_award(award)
      expect(actor.awards).to include award
    end
  end
end

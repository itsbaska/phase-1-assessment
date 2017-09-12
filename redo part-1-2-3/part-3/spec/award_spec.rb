require_relative "spec_helper"

describe Award do
  let (:award) { Award.new(category: "Best Stage Musical", type: "Tony Award", year: 1996) }

  it "has a category" do
    expect(award.category).to eq "Best Stage Musical"
  end

  it "has a type" do
    expect(award.type).to eq "Tony Award"
  end

  it "has a year" do
    expect(award.year).to eq 1996
  end

  it "combines the year, type, and category to form a name" do
    expect(award.name).to eq "1996 Tony Award for Best Stage Musical"
  end
end

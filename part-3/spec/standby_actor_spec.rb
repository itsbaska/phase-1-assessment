require_relative "spec_helper"

describe StandbyActor do
  let (:standby) { StandbyActor.new(name: "Sutton Foster") }

  it "has a name" do
    expect(standby.name).to eq "Sutton Foster"
  end

  it "defaults to having no roles" do
    expect(standby.roles).to eq []
  end

  it "can be instantiated with roles" do
    role = "Liza Miller"
    standby = StandbyActor.new(roles: [role])

    expect(standby.roles).to match_array [role]
  end

  it "defaults to having no roles prepared for" do
    expect(standby.prepared_for_roles).to eq []
  end

  it "can be instantiated with roles prepared for" do
    role = "Claire Underwood"
    standby = StandbyActor.new(prepared_for_roles: [role])

    expect(standby.prepared_for_roles).to match_array [role]
  end
end

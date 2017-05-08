require 'spec_helper'

describe Card do
  let(:super_hero) { 
    Card.new({
      number: "1",
      name: "Hulk",
      type: "Super Heroes",
      rarity: "common"
    })}

  let(:rookie) { 
    Card.new({
      number: "3",
      name: "Siege",
      type: "Rookies",
      rarity: "common"
    })}

  let(:super_villain) { 
    Card.new({ 
      number: "79",
      name: "Dr. Doom",
      type: "Super-Villains",
      rarity: "common" 
    })}

  let(:alien_race) { 
    Card.new({
      number: "119",
      name: "Brood",
      type: "Alien Races", 
      rarity: "common"
    })}

  it "should have a number" do
    expect(super_hero.number).to eq("1")
  end

  it "should have a type" do
    expect(rookie.type).to eq("Rookies")
  end

  it "should have a name" do
    expect(super_villain.name).to eq("Dr. Doom")
  end

  it "should have a rarity." do
    expect(alien_race.rarity).to eq("common")
  end
end

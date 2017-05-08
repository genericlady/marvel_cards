require 'spec_helper'

describe MarvelScraper, :vcr do
  let(:marvel_scraper) { MarvelScraper.new }
  let(:super_hero) { 
    Card.new({
      number: "1",
      name: "Hulk",
      type: "Super Heroes",
      rarity: "common"
    })}

  it "will run" do
    MarvelScraper.new.run
  end

  describe "has helper methods to get nodes and parse data", :vcr do
    it "card_list will return an array of nokogiri nodes" do
      expect(marvel_scraper.card_list.class).to eq(Nokogiri::XML::NodeSet)
      expect(marvel_scraper.card_list.first.class).to eq(Nokogiri::XML::Element)
    end
  end
end

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

    it "parse_commons will parse a string of commons into an array of cards." do
      commons = marvel_scraper.parse_commons(commons_text_only_stub)
      expect(commons.first.class).to eq(Card)
    end

    it "parse_unsolved_mysteries will parse a string of unsolved mysteries." do
      unsolved_mysteries = 
        marvel_scraper.parse_unsolved_mysteries(unsolved_mysteries_stub)
    end
  end

  describe "card_text_matches returns a MatchData object with 3 matches" do
    let(:matches) { MarvelScraper.new.common_card_matches("1 Hulk Super Heroes") }

    it "should have a match for card number" do
      expect(matches[1]).to eq("1")
    end

    it "should have a match for card name" do
      expect(matches[2].strip).to eq("Hulk")
    end

    it "should have a match for card type" do
      expect(matches[3].strip).to eq("Super Heroes")
    end
  end

end

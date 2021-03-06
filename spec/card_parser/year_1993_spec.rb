require 'spec_helper'

describe CardParser::Year1993, :vcr do
  let(:marvel_scraper) { MarvelScraper.new }
  let(:year_1993) { CardParser::Year1993.new(marvel_scraper.card_list) }

  it "parse_commons will parse a string of commons into an array of cards." do
    commons = year_1993.commons
    expect(commons.first.class).to eq(Card)
  end

  it "parse_unsolved_mysteries will parse a string of unsolved mysteries." do
    unsolved_mysteries = year_1993.unsolved_mysteries
    expect(unsolved_mysteries.first.class).to eq(Card)
  end

end

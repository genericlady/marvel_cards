require 'open-uri'
require 'nokogiri'
require 'pry'

# define a method to check if the host is up 200 ok
class MarvelScraper
  attr_reader :doc, :parser

  def initialize
    @doc = Nokogiri::HTML(open('http://www.nslists.com/mrvuni93.htm'))
    @parser = CardParser::Year1993.new(card_list)
  end

  def run
    binding.pry
    puts [ 
      commons, unsolved_mysteries, famous_battles, 
      chase_cards[:red_foil_stamped], chase_cards[:three_dimension_hologram],
      chase_cards[:promo_cards], 
    ]
  end

  def commons 
    parser.commons
  end

  def unsolved_mysteries 
    parser.unsolved_mysteries
  end

  def famous_battles 
    parser.famous_battles
  end

  def chase_cards 
    {
      red_foil_stamped: parser.red_foil_stamped,
      three_dimension_hologram: parser.three_dimension_hologram,
      promo_cards: parser.promo_cards
    }
  end

  def card_list
    @card_list ||= doc.css(".c4").children
  end

end

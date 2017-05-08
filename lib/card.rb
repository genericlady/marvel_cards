class Card
  attr_accessor :number, :name, :type, :rarity

  def initialize(card_hash={})
    @number = card_hash[:number]
    @name = card_hash[:name]
    @type = card_hash[:type]
    @rarity = card_hash[:rarity]
  end

end

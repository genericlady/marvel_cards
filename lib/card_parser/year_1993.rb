class CardParser::Year1993
  attr_reader :card_list

  def initialize(card_list)
    @card_list = card_list
  end

  def commons
    card_list[3].text.split(/\r/).map do |card|
      card_text = card.squeeze(' ').strip
      unless card_text.empty? || card_text[0..2] == "No."
        match = common_card_matches(card_text)
        Card.new.tap do |c|
          c.rarity = "common"
          c.number = match[1]
          c.name = match[2].strip
          c.type = match[3].strip
        end
      end
    end.compact
  end

  def unsolved_mysteries
    card_list[5].text.split(/\r/).map do |card|
      card_text = card.squeeze(' ').strip
      unless card_text.empty?
        match = card_text.match(/^\d+/)
        Card.new.tap do |c|
          c.number = match.to_s
          c.name = match.post_match.strip
          c.rarity = "Unsolved Mysteries"
        end
      end
    end.compact
  end

  def famous_battles
    card_list[7].text.split(/\r/).map do |card|
      card_text = card.squeeze(' ').strip
      unless card_text.empty?
        match = card_text.match(/^\d+/)
        Card.new.tap do |c|
          c.number = match.to_s
          c.name = match.post_match.strip
          c.rarity = "Famous Battles"
        end
      end
    end.compact
  end

  def common_card_matches(card_text)
    create_common_card_matches(card_text)
  end

  def create_common_card_matches(card_text)
    card_number = "(^\\d+)"
    character_name = "(\\s\\D+)"
    character_type = 
      "(\\sSuper-?\\s?Heroes|\\sSuper-?\\s?Villains|\\sRookies|\\sAlien-?\\sRaces)"
    expression = card_number + character_name + character_type
    card_text.
      match(Regexp.new(expression, Regexp::EXTENDED | Regexp::IGNORECASE))
  end

  def red_foil_stamped
    card_list[11].text.split(/\r/).map do |card|
      card_text = card.squeeze(' ').strip
      unless card_text.empty? || card_text == "(1:10 packs)"
        match = card_text.match(/^\d+/)
        Card.new.tap do |c|
          c.number = match.to_s
          name = match.post_match.gsub("-", "")
          if name[(name.length-4)..-1] == "2099"
            c.name = name[0...-5]
          else
            c.name = name
          end
          c.type = "Red Foil Stamped"
          c.rarity = "CHASE CARDS"
        end
      end
    end.compact
  end

  def three_dimension_hologram
    card_list[13].text.split(/\r/).map do |card|
      card_text = card.squeeze(' ').strip
      unless card_text.empty? || card_text == "(1:180 packs)" 
        match = card_text.match(/H-IV/)
        Card.new.tap do |c|
          c.number = match.to_s
          c.name = match.post_match.strip
          c.rarity = "CHASE CARDS"
          c.type = "hologram"
        end
      end
    end.compact
  end

  def promo_cards
    card_list[15].text.split(/\r/).map do |card|
      card_text = card.squeeze(' ').strip
      footer_text = "Searchwords: jahoc, yr1993, mfrSkybox, catMarvel"
      unless card_text.empty? || card_text == footer_text
        match = card_text.match(/0|---/)
        Card.new.tap do |c|
          unless match.to_s == "---"
            c.number = match.to_s
          end
          c.name = match.post_match.strip
          c.type = "Promo Card"
          c.rarity = "CHASE CARDS"
        end
      end
    end.compact
  end

end

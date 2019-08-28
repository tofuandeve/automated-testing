class Deck
  attr_reader :cards
  
  def initialize
    @cards = Card.create_new_deck
  end
  
  def count
    return @cards.length
  end
  
  def draw
    return @cards.pop
  end
  
  def shuffle
    @cards.shuffle!
  end
end

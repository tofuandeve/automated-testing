class Card
  VALUES = {
    "1"=> "Ace",
    "2"=> "2",
    "3"=> "3",
    "4"=> "4",
    "5"=> "5",
    "6"=> "6",
    "7"=> "7",
    "8"=> "8",
    "9"=> "9",
    "10"=> "10",
    "11"=> "Jack",
    "12"=> "Queen",
    "13"=> "King"
  }
  
  SUITS = [:hearts, :spades, :clubs, :diamonds]
  attr_reader :value, :suit
  
  def initialize(value, suit)
    raise ArgumentError.new("Invalid card value!") if !VALUES.keys.include?(value.to_s)
    @value = value
    raise ArgumentError.new("Invalid card suit!") if !SUITS.include?(suit)
    @suit = suit
  end
  
  def to_s
    return "#{VALUES[value.to_s]} of #{suit.to_s}"
  end
  
  def self.create_new_deck
    cards = Array.new
    VALUES.each do |key, value|
      4.times do |index|
        cards << Card.new(key.to_i, SUITS[index])
      end
    end
    return cards
  end
end

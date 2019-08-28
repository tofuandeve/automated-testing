require_relative 'test_helper'

describe Card do
  describe "You can create a Card instance" do
    
    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end
    
    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect {Card.new(0, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :clovers)}.must_raise ArgumentError
    end
  end
  
  describe "Testing to_s" do
    it "to_s returns a readable String value logically for values 2-10" do
      (2..10).each do |value|
        card = Card.new(value, :diamonds)
        expect (card.to_s).must_equal "#{value} of diamonds"
      end
    end
    
    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      face_cards = {
        "1"=> "Ace",
        "11"=> "Jack",
        "12"=> "Queen",
        "13"=> "King"
      }
      
      (1..13).each do |value|
        card = Card.new(value, :hearts)
        if face_cards.keys.include? value.to_s
          expect (card.to_s).must_equal "#{face_cards[value.to_s]} of hearts"
        else
          expect (card.to_s).must_equal "#{value} of hearts"
        end
      end
    end
  end
  
  describe "Reader methods" do
    it "Can retrieve the value of the card using a `.value`." do
      (1..13).each do |value|
        card = Card.new(value, :hearts)
        
        expect (card.value).must_be_instance_of Integer
        expect (card.value).must_equal value
      end
    end
    
    it "Can retrieve the value of the card using a `.suit`." do
      suits = [:hearts, :spades, :clubs, :diamonds]
      suits.each do |suit|
        card = Card.new(2, suit)
        
        expect (card.suit).must_be_instance_of Symbol
        expect (card.suit).must_equal suit
      end    
    end
  end
  
  describe "#self.create_new_deck method" do
    NUMBER_OF_CARDS = 52
    CARDS = Card.create_new_deck
    VALID_SUITS = [:hearts, :spades, :clubs, :diamonds]
    it "returns a deck of 52 cards" do
      expect (CARDS).must_be_instance_of Array
      expect (CARDS.length).must_equal NUMBER_OF_CARDS
    end
    
    it "returns a deck of Card objects" do
      NUMBER_OF_CARDS.times do |index|
        expect (CARDS[index]).must_be_instance_of Card
      end
    end
    
    it "generates 4 cards for each value" do
      my_value = 2
      my_cards = CARDS.select { |card| card.value == my_value}
      expect (my_cards.length).must_equal 4
    end
    
    it "generates 4 different suits for each value" do
      my_value = 11
      my_cards = CARDS.select { |card| card.value == my_value}
      expect (my_cards.length).must_equal 4
      
      my_suits = my_cards.map { |card| card.suit }
      expect (my_suits.length).must_equal 4
      assert_nil(my_suits.uniq!)
      my_suits.each do |suit|
        expect (VALID_SUITS.include?(suit)).must_equal true
      end
    end       
  end     
end
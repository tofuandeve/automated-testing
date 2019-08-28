require_relative 'test_helper'

describe Deck do
    before do
        @deck = Deck.new
    end
    
    describe "constructor" do
        it "creates an instance of Deck" do
            expect (@deck).must_be_instance_of Deck
        end
        
        it "creates a deck of 52 Card objects" do
            expect (@deck.count).must_equal 52
            expect (@deck.cards.sample).must_be_instance_of Card
        end   
    end
    
    describe "#shuffle method" do
        it "should not modify the number of cards" do
            expect (@deck.shuffle.count).must_equal 52
        end
    end
    
    describe "#draw method" do
        it "returns a Card object as an output" do
            card = @deck.draw
            expect (card).must_be_instance_of Card
            expect (@deck.count).must_equal 51
            expect (@deck.cards.include?(card)).must_equal false
        end
        
        it "returns nil if the deck is empty" do
            deck1 = Deck.new
            52.times do
                deck1.draw
            end
            
            assert_nil (deck1.draw)
        end
    end
    
    describe "#count method" do
        before do
            @deck2 = Deck.new
        end
        
        it "returns the current number of cards in the deck" do
            expect (@deck2.count).must_equal 52
        end
    end
end

require_relative 'card'

class Shoe
  attr_accessor :num_decks, :available_cards, :discard_pile

  def initialize(num_decks = 6)
    @num_decks = num_decks
    @available_cards = []
    @discard_pile = []

    num_decks.times do
      @available_cards.push(*create_deck)
    end

    shuffle
  end

  def shuffle
    @available_cards.push(*discard_pile)
    1000.times do |i|
      @available_cards.shuffle!
    end
  end

  def get_next_card
    card = @available_cards.shift
    @discard_pile.push(card)
    card
  end

  def peek_next_card
    @available_cards[0]
  end

  private
    def create_deck
      deck = []
      ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].each do |value|
        ['hearts', 'diamonds', 'spades', 'clubs'] .each do |suit|
          deck.push(Card.new(value, suit))
        end
      end
      deck
    end
end

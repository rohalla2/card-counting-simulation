require 'spec_helper'
require_relative '../shoe'

describe Shoe, '#initialize' do
  context 'when number of decks is provided' do
    it 'sets the number of decks to the number provided' do
      shoe = Shoe.new(2)
      expect(shoe.num_decks).to eq 2
    end
  end

  context 'when number of decks is not provided' do
    it 'sets the number of decks to 6' do
      shoe = Shoe.new
      expect(shoe.num_decks).to eq 6
    end
  end
end

describe Shoe, '#shuffle' do
  it 'combines available_cards and discard_pile' do
    shoe = Shoe.new(1)
    shoe.get_next_card
    shoe.shuffle
    expect(shoe.available_cards.length).to eq 52
  end

  it 'randomizes the order of available_cards' do
    shoe = Shoe.new()
    old_order = shoe.available_cards.dup
    shoe.shuffle
    expect(shoe.available_cards).not_to eq(old_order)
  end
end

describe Shoe, '#get_next_card' do
  it 'returns a card' do
    shoe = Shoe.new
    expect(shoe.get_next_card).to be_a(Card)
  end

  it 'decrements the number of cards availble' do
    shoe = Shoe.new
    initial_card_num = shoe.available_cards.length
    shoe.get_next_card
    expect(shoe.available_cards.length).to eq initial_card_num - 1
  end

  it 'increments the number of cards in discard pile' do
    shoe = Shoe.new
    initial_card_num = shoe.discard_pile.length
    shoe.get_next_card
    expect(shoe.discard_pile.length).to eq initial_card_num + 1
  end
end

describe Shoe, '#peek_next_card' do
  it 'returns a card' do
    shoe = Shoe.new
    expect(shoe.peek_next_card).to be_a(Card)
  end

  it 'does not remove a card from the deck' do
    shoe = Shoe.new
    initial_card_num = shoe.available_cards.length
    shoe.peek_next_card
    expect(shoe.available_cards.length).to eq initial_card_num
  end

  it 'does not add a card to the discard pile' do
    shoe = Shoe.new
    initial_card_num = shoe.discard_pile.length
    shoe.peek_next_card
    expect(shoe.discard_pile.length).to eq initial_card_num
  end
end
require 'spec_helper'
require_relative '../card'

describe Card, '#initialize' do
  context "when provided with all params" do

    it "sets the value property on the card" do
      card = Card.new('A', 'spades')
      expect(card.value).to eq 'A'
    end

    it "sets the suit property on the card" do
      card = Card.new('A', 'spades')
      expect(card.suit).to eq 'spades'
    end
  end

  context "when not all params are provided" do
    it "raises an error" do
      expect{Card.new}.to raise_error(ArgumentError)
    end
  end
end

describe Card, '#to_s' do
  it "returns the value and suit of the card" do
    card = Card.new('A', 'spades')
    expect(card.to_s).to eq 'A of spades'
  end
end
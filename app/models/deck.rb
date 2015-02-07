require_relative 'card'

class Deck < ActiveRecord::Base
  # attr_reader :cards
  # def initialize(cards = nil)
  #   @cards = cards || []
  # end
  has_many :cards

  def card_count
    self.cards.count
  end

  def random_unsolved
    # self.cards.select {|card| card.solved == false }.sample
    self.cards.where(solved: false).sample
  end

  def check_card_solved?(card, guess = '')
    card.solved = true if card.word == guess
    return card.solved
  end

  def check_deck_solved?
    self.cards.all? {|card| card.solved == true }
    self.cards.where(solved: false).count == 0
  end
end

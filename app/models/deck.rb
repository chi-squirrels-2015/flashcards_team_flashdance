require_relative 'card'

class Deck < ActiveRecord::Base
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

  def count_solved
    count = 0
    self.cards.each do |card|
      if card.solved
        count += 1
      end
    end
    count
  end

  def percent_solved
    percent = (((count_solved).to_f/(card_count).to_f)*100).to_i
  end
end

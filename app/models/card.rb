class Card < ActiveRecord::Base

  # attr_accessor :word, :definition, :solved

  # def initialize(card_attributes = {})
  #   @word = card_attributes[:word]
  #   @definition = card_attributes[:definition]
  #   @solved = solved || false
  # end
  belongs_to :deck
end


def get_file(filename)
  file = filename
  stack = []
  card_array = []
  File.readlines(file).each do |line|
    stack << line unless line == "\n"
    stack.each {|char| char.gsub!(/\n/, '') }
  end
  counter = 0
  while counter < stack.length
    card_array << Card.create(:definition => stack[counter], :word => stack[counter + 1], :solved => false)
    counter += 2
  end
  card_array
end


cards = get_file('db/flashcard_samples.txt')
Deck.create(name:"first_deck")
cards.each do |card|
  card.deck = Deck.find_by(name: "first_deck")
  card.save
end

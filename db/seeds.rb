
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


code_cards = get_file('db/flashcard_samples.txt')
Deck.create(name:"coding")
code_cards.each do |card|
  card.deck = Deck.find_by(name: "coding")
  card.save
end

capital_cards = get_file('db/capitals.txt')
Deck.create(name:"capitals")
capital_cards.each do |card|
  card.deck = Deck.find_by(name: "capitals")
  card.save
end

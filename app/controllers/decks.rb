get '/homepage' do
  erb :'homepage'
end

# get '/decks/:id' do

#   erb :"/deck/show"
# end

# get '/decks/:id/cards/new' do
# @deck = Deck.find(params[:id])
# @deck.random_card
#   #pull card from deck randomly
#   #present card.definition in view
#   erb :'decks/new'
# end

# post '/decks/:id/cards' do

#   if correct,
#     mark as solved
#     erb :correct
#     if deck.solved = true
#       print erb :win
#   elsif wrong
#     mark as unsolved
#     erb :wrong
# end



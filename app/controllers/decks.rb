get '/homepage' do
  @deck = Deck.all.sample
  erb :'/decks/homepage'
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @card = @deck.random_unsolved
  erb :"/decks/show"
end

# get '/decks/:id/cards/new' do
# @deck = Deck.find(params[:id])
# @deck.random_card
#   #pull card from deck randomly
#   #present card.definition in view
#   erb :'decks/new'
# end

post '/cards/:id' do
  @card = Card.find(params[:id])
  @deck = @card.deck
  @new_card = @deck.random_unsolved
  # if @deck.check_deck_solved?
  #   erb :final_page
  # else
    if @deck.check_card_solved?(@card, params[:guess])
      erb :"cards/correct"
    else
      erb :"cards/incorrect"
    end
  # end
end
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



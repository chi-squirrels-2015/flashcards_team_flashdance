get '/homepage' do
  erb :'/decks/homepage'
end

get '/decks/' do
  p params
  if params[:name] == "coding"
    @deck = Deck.find_by(name: "coding")
  else
    @deck = Deck.find_by(name: "capitals")
  end
  id = @deck.id
  redirect "/decks/#{id}"
end

get '/decks/:id' do
  p params
  @deck = Deck.find(params[:id])
  @card = @deck.random_unsolved
  @image = @deck.image
  @percent_solved = @deck.percent_solved
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

  # if @deck.check_deck_solved?
  #   erb :final_page
  # else
  p params
    if @deck.check_card_solved?(@card, params[:guess])
      puts "IM INSIDE CORRECT"
      @new_card = @deck.random_unsolved
      @percent_solved = @deck.percent_solved
      erb :"cards/correct"
    else
      puts "IM INSIDE INCORRECT"
      @new_card = @deck.random_unsolved
      @percent_solved = @deck.percent_solved
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



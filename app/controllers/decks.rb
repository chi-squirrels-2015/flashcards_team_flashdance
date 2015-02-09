get '/homepage' do
  session.clear
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
  session[:count] ||= 0
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
  total_count = @deck.card_count.to_f

  # if @deck.check_deck_solved?
  #   erb :final_page
  # else
  p params
    if @deck.check_card_solved?(@card, params[:guess])
      @new_card = @deck.random_unsolved
      session[:count] += 1
      @percent_solved = (((session[:count]).to_f/total_count)*100).to_i
      erb :"cards/correct"
    else
      @new_card = @deck.random_unsolved
      @percent_solved = (((session[:count]).to_f/total_count)*100).to_i
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



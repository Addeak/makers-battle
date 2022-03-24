require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'
require './lib/game'
require './lib/attack'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    redirect '/victory' if @game.current_turn.dead?
    erb :play
  end

  get '/attack' do
    @game = $game
    Attack.run(@game.opponent_of(@game.current_turn))
    erb :attack
  end

  post '/switch-turns' do
    $game.switch_turns
    redirect '/play'
  end

  get '/victory' do
    @game = $game
    erb :victory
  end

  run if app_file == $0
end
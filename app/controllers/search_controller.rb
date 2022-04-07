class SearchController < ApplicationController
  def index
    @games = Game.where('game_name LIKE ?', "%#{params[:q]}%")
    @game_count = Game.where('game_name LIKE ?', "%#{params[:q]}%")
  end

  def show
  end
end

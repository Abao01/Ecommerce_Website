class SearchController < ApplicationController
  def index
    @games = Game.where('name LIKE ?', "%#{params[:q]}%")
    @game_count = Game.where('name LIKE ?', "%#{params[:q]}%")
  end

  def show
  end
end

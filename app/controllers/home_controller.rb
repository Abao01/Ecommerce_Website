class HomeController < ApplicationController
  def index
    @games = Game.includes(:publisher).all
    @games = Game.page params[:page]
  end
end

class HomeController < ApplicationController
  def index
    @games = Game.includes(:publisher).all
  end
end

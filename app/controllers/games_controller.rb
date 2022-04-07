class GamesController < ApplicationController
  def index
    @games = Game.includes(:publisher).all
    @publishers = Publisher.distinct.pluck(:Publisher_name)
    @prices = Game.distinct.pluck(:price)

    if params[:keywords].present?
      @games = @games.where("name LIKE ?", "%#{params[:keywords]}%")
    end

    if params[:publisher].present?
      @games = @games.joins(:publisher).where("publishers.publisher_name like ?", "%#{params[:publisher]}%")
    end

    if params[:min_price].present?
      @games = @games.where("price >= ?", params[:min_price])
    end

    if params[:max_price].present?
      @games = @games.where("price <= ?", params[:max_price])
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def search
    wildcard = "%#{params[:keywords]}%"
    @games = Game.where("name LIKE ?", wildcard)
  end
end

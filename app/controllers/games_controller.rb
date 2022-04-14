class GamesController < ApplicationController
  def index
    @games = Game.includes(:publisher).all
    @publishers = Publisher.distinct.pluck(:publisher_name)
    @prices = Game.distinct.pluck(:price)

    if params[:keywords].present?
      @games = @games.where("game_name LIKE ?", "%#{params[:keywords]}%")
    end

    if params[:publisher].present?
      @games = @games.joins(:publisher).where("publisher_name like ?", "%#{params[:publisher]}%")
    end

    if params[:genre].present?
      @games = @games.joins(:genre).where("name like ?", "%#{params[:genre]}%")
    end

    if params[:min_price].present?
      @games = @games.where("price >= ?", params[:min_price])
    end

    if params[:max_price].present?
      @games = @games.where("price <= ?", params[:max_price])
    end

    if params[:publish_time].present?
      case params[:publish_time]
        when "last_3_days_created"
          @games = @games.where("created_at > ?", 3.hours.ago)
        when "last_3_days_updated"
          @games = @games.where("updated_at > :keyword and created_at <= :keyword", keyword: 3.hours.ago)
      end
    end
    # @gamess = Game.page params[:page]
  end

  def show
    @game = Game.find(params[:id])
  end

  def search
    wildcard = "%#{params[:keywords]}%"
    @games = Game.where("game_name LIKE ?", wildcard)
  end
end

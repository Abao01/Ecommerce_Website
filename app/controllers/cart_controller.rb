class CartController < ApplicationController

  def create
    # data sent as data,we will capture this data by way of params
    logger.debug("Adding #{params[:id]} to cart")
    id = params[:id].to_i
    # pp session[:shopping_cart]
    # num = session[:shopping_cart][id] ||= 0
    # session[:shopping_cart][id] = num + 1
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id # push id onto the end of the cart array
      game = Game.find(id)

      flash[:notice] = " ➕#{game.game_name} added to cart."
      redirect_to root_path
    end
  end

  def destroy
    logger.debug("***Trying to delete #{params[:id]} from cart. ")
      id = params[:id].to_i
      session[:shopping_cart].delete(id)
      game = Game.find(id)
      flash[:notice] = "➖ #{game.game_name} removed from cart."
      redirect_to root_path
  end

end

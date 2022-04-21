class CartController < ApplicationController

  def create
    # data sent as data,we will capture this data by way of params
    logger.debug("Adding #{params[:id]} to cart")
    id = params[:id].to_i
    pp session[:shopping_cart]
    num = session[:shopping_cart][id] ||= 0
    session[:shopping_cart][id] = num + 1
  end

  def destroy
    #remove an item from our shopping cart
    #params[:id]
  end

end

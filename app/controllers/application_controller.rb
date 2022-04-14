class ApplicationController < ActionController::Base
  before_action :initialize_session

  private

  def initialize_session
    #this will initialize the visit count to zero for new users
    session[:shopping_cart] ||= 0 #empty array that will products IDs
  end

  def cart
    #collection of products available in our shopping cart
    Game.find(session[:shopping_cart])
  end

end

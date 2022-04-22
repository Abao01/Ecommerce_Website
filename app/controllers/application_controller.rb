class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    #this will initialize the visit count to zero for new users
    # session[:shopping_cart] ||= [] #empty array that will products IDs
    unless session[:shopping_cart].is_a?(Array)
      session[:shopping_cart] = []
    end
  end

  def cart
    #collection of products available in our shopping cart
    Game.find(session[:shopping_cart])
  end

end

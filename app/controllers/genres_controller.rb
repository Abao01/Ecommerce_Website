class GenresController < ApplicationController
  def index
    @genres = Genre.all
    # @genres = Genre.ordered_by_genres
    # .page params[:page]
  end

  def show
    @genre = Genre.find(params[:id])
  end
end
class PublishersController < ApplicationController
  def index
    @publishers = Publisher.order(:name)
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end

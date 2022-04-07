class PublishersController < ApplicationController
  def index
    @publishers = Publisher.order(:publisher_name)
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end

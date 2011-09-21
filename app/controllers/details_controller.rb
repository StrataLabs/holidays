class DetailsController < ApplicationController
  def create
    if Detail.build!(params[:inquiry_id], params[:detail])
      head :ok
    else
      head :status => :unprocessable_entity
    end
  end
end

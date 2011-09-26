class DetailsController < ApplicationController
  before_filter :validate_ids_in_params

  def create
    detail =  Detail.build!(params[:inquiry_id], params[:detail])
    if detail.valid?
      head :ok
    else
      head :status => :unprocessable_entity
    end
  end
end

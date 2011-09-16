class ResponsesController < ApplicationController
  def create_or_update
    result = Response.create_or_update_for_inquiry_id(params[:inquiry_id], params[:question_id], params[:preferences])
    if result.save
      head :ok
    else
      head :unprocessable_entity
    end
  end
end

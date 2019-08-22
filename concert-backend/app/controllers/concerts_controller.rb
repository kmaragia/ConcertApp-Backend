class ConcertsController < ApplicationController

  def index
    render json: Concert.all
  end

  def destroy
    Concert.find(params[:id]).destroy
  end


end

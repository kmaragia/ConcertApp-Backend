
class ConcertsController < ApplicationController

  def index
    render json: Concert.all
  end


end

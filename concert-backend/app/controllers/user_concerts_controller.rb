class UserConcertsController < ApplicationController

    def index
      render json: UserConcert.all
    end
    def create

      new_concert = UserConcert.create(user_params)
      render json: new_concert
    end

    def destroy
      find_params.destroy
    end

  private

  def user_params
     params.require(:user_concert).permit(:user_id,:concert_id)
  end

 def find_params
   UserConcert.find(params[:id])
 end
end

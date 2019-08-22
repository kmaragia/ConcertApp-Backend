class UsersController < ApplicationController
  def index
    render json: User.all.to_json(:include => {
      :concerts => {:only => [:id,:artist_id,:name,:location,:img,:date,:time,:venue_address]}
      })
  end

  # def show
  #   render json: find_params.to_json(
  #     except:[:created_at, :updated_at])
  # end
  def home
    token = request.headers["Authentication"].split(" ")[1]
    payload = decode(token)
    user = User.find(payload["user_id"])
    if user
      render json: user, status: :accepted
    else
      render json: {message: "Error", authenticated: false}
    end
  end

  def show
    user = find_params
    render json: user.to_json(:include => {
      :concerts => {:only => [:id,:artist_id,:name,:location,:img,:date,:time,:venue_address]}
      })
  end


  def create
    new_user = User.create!(user_params)
    render json: new_user
  end


  def update
    find_params.update(user_params)
    render json: find_params
  end

  def destroy
    find_params.destroy
  end

  private

  def user_params
     params.require(:user).permit(:first_name,:last_name,:username,:password,:phone_number,:email)
  end

 def find_params
   User.find(params[:id])
 end
end

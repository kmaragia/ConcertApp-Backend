class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: find_params.to_json(
      except:[:created_at, :updated_at])
  end

  def create
    new_user = User.create(user_params)
    render json: new_user.to_json
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
     params.require(:user).permit(:name,:DOB,:password,:Phone_number,:email)
  end

 def find_params
   User.find(params[:id])
 end
end

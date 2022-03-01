class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: :show

  def index
    @users = User.all
  end

  def show
  end

  def update
    if current_user.update_attributes(user_params)
    render :show
    else
    render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio)
  end

end

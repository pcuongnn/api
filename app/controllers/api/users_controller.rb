class Api::UsersController < Api::ApiController
  skip_before_action :authenticate_user_from_token!, only: [:create]
  before_action :authenticate_user!, except: [:create]

  def create
    @user = User.new user_params
    if @user.save
      render json: @user
    else
      render json: {error: {code: "U_405_2", msg: @user.errors.full_messages}}, status: 405
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_number)
  end

end
class UsersController < ApplicationController

  private
  
  def user_params
    params.require(:user).permit(User::USER_COLUMNS)
  end
end

class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = User.new(user_params)

    puts '#######*****'

    if @user.save!
      render plain: 'User was successfully created.'
     else
       render action: 'new'
    end
  end

  def new

  end

  def user_params
    params.require(:user).permit(:avatar, :name)
  end
end

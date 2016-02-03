class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def new
    @title = '会員登録' #タイトル変数セット
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "会員登録が完了しました"
    else
      render 'new'
    end
  end
  
  def show
    @title = @user.name #タイトル変数セット
    @items = @user.items.group('items.id')
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end

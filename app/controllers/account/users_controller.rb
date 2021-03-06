class Account::UsersController < ApplicationController
  def new
    @account = Account.find(params[:id])
    @user = User.new
  end

  def create
    @account = Account.find(params[:account_id])
    @user = User.new(user_params)
    @user.assign_attributes(account_id: @account.id)
    if @user.save
      redirect_to @account, notice: "User has been created."
    end
  end

  def edit
    @user = User.find(params[:id])
    @account = Account.find(@user.account_id)
  end

  def update
    @user = User.find(params[:id])
    @account = Account.find(@user.account_id)
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to @account, notice: "User info is updated."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @account = Account.find(@user.account_id)
    if @user.destroy
      redirect_to @account, notice: "User has been deleted"
    else
      redirect_to @account, notice: "There has been an error deleting the user."
    end
  end

  private

  def user_params
    params.require(:user).permit( :first_name, :last_name, :email, :admin, :password, :password_confirmation)
  end
end

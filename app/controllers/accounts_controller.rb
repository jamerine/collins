class AccountsController < ApplicationController

  def new
    @account = Account.new
    @user = User.new
  end

  def create
    @account = Account.create(account_params)
    @user = User.new(first_name: params[:account][:user][:first_name], last_name: params[:account][:user][:last_name], email: params[:account][:user][:email], password: params[:account][:user][:password], password_confirmation: params[:account][:user][:password_confirmation], admin: true)
    @user.account_id = @account.id
    if @user.save
      sign_in(@user)
      flash[:notice] = "Your account has been created."
      redirect_to @account
    else
      redirect_to :new, alert: 'Account creation has failed, please try again.'
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  def destroy
    @account = Account.find(params[:id])
    if @account.destroy
      redirect_to root_path, notice: 'Account has been deleted'
    else
      redirect_to @account, alert: 'There has been an issue deleting the account.  Please try again.'
    end
  end
  private

  def account_params
    params.require(:account).permit(:business_name,
    { users_attributes: [:first_name, :last_name, :email, :password, :password_confirmation, :admin ] }
    )
  end
end

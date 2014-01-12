class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_account, only: [:edit, :show, :update, :destroy]

  def index
    @accounts = current_user.accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(safe_account)
    @account.user_id = current_user.id

    if @account.save
      flash[:notice] = "Account was created."
      redirect_to @account
    else
      render 'new'
    end
  end

  def show
    month = view_context.get_current_month

    if params.has_key?("period")
      month = params[:period][:date]
    end

    @transactions = @account.transactions.period(month)#.order(date_of: :asc).page(params[:page]).per(2)  
  end

  def edit
    render
  end

  def update
    if @account.update(safe_account)
      flash[:notice] = "Account was updated."
      redirect_to @account
    else
      render 'edit'
    end
  end

  def destroy
    @account.destroy
    flash[:alert] = "Account was deleted."
    redirect_to accounts_path
  end

  private

  def find_account
    @user = User.find(current_user)
    @account = @user.accounts.find(params[:id])
  end

  def safe_account
    params.require(:account).permit(:account_name, :account_number, :account_type, :account_balance, :user_id)
  end
end

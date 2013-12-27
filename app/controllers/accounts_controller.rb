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
    @account = Account.create safe_account

    if @account.save
      find_account_type_name
      flash[:notice] = get_flash_message
      redirect_to @account
    else
      render 'new'
    end
  end

  def edit
    render
  end

  def show
    render
  end

  def update
    if @account.update safe_account
      find_account_type_name
      flash[:notice] = get_flash_message
      redirect_to @account
    else
      render 'edit'
    end
  end

  def destroy
    @account.destroy
    find_account_type_name
    flash[:alert] = get_flash_message
    redirect_to accounts_path
  end

  private

  def find_account
    @account = Account.find params[:id]
  end

  def get_flash_message
    msg = "The #{@account_type_name} account '#{@account.account_name} x#{@account.account_number}' was "

    case params[:action]
    when 'create'
      msg_action = 'created'
    when 'update'
      msg_action = 'updated'
    when 'destroy'
      msg_action = 'deleted'
    else
      msg_action = ''
    end

    msg << msg_action << '.'
  end

  def find_account_type_name
    @account_type_name = view_context.find_account_type(@account.account_type).downcase
  end

  def safe_account
    params.require(:account).permit(:account_name, :account_number, :account_type, :account_balance, :user_id)
  end
end

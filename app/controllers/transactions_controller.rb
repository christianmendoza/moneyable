class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_account, only: [:index, :new, :create]
  before_action :find_transaction, only: [:edit, :show, :update, :destroy]

  def index
    @transactions = @account.transactions
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(safe_transaction)

    if @transaction.save
      balance_transactions
      flash[:notice] = "Transaction added."
      redirect_to account_path(@account)
    else
      render 'new'
    end
  end

  def show
    render
  end

  def edit
    render
  end

  def update
    if @transaction.update(safe_transaction)
      balance_transactions
      flash[:notice] = "Transaction updated."
      redirect_to account_path(@account)
    else
      render 'edit'
    end
  end

  def destroy
    @transaction.destroy
    balance_transactions
    flash[:alert] = "Transaction was deleted."
    redirect_to account_path(@account)
  end

  private

  def find_account
    @user = User.find(current_user)
    @account = @user.accounts.find(params[:account_id])
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
    @user = User.find(current_user)
    @account = @user.accounts.find(@transaction.account_id)
  end

  def safe_transaction
    params.require(:transaction).permit(:date_of, :transaction_type, :description, :amount, :transaction_cleared, :notes, :account_id, :category_id, :balance_to_date)
  end

  def balance_transactions
    @transactions = @account.transactions.get_all_transactions_after(@transaction)
    view_context.update_transaction_balances(@transactions)
  end
end
